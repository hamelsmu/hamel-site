---
title: Batch Predictions
order: 4
---

# How to make batch predictions in fastai

Making batch predictions on new data is not provided "out of the box" in fastai.  This is how you can achieve that:

Add this method to learner:
```python
@patch
def predict_batch(self:Learner, item, rm_type_tfms=None, with_input=False):
    dl = self.dls.test_dl(item, rm_type_tfms=rm_type_tfms, num_workers=0)
    inp,preds,_,dec_preds = self.get_preds(dl=dl, with_input=True, with_decoded=True)
    i = getattr(self.dls, 'n_inp', -1)
    inp = (inp,) if i==1 else tuplify(inp)
    dec_inp, nm = zip(*self.dls.decode_batch(inp + tuplify(dec_preds)))
    res = preds,nm,dec_preds
    if with_input: res = (dec_inp,) + res
    return res
```

You can then use this method like so:

```python
>>> from fastai.text.all import *
>>> from predict_batch import predict_batch # this file.  If you don't import just define in your script.
>>> dls = TextDataLoaders.from_folder(untar_data(URLs.IMDB), valid='test')
>>> learn = text_classifier_learner(dls, AWD_LSTM, drop_mult=0.5, metrics=accuracy)
>>> learn.fine_tune(4, 1e-2)
>>> learn.predict_batch(["hello world"]*4)
(TensorText([[0.0029, 0.9971],
         [0.0029, 0.9971],
         [0.0029, 0.9971],
         [0.0029, 0.9971]]),
 ('pos', 'pos', 'pos', 'pos'),
 TensorText([1, 1, 1, 1]))
```

Alternatively, you can just patch the predict function so it works on batches:

```python
@patch
def predict(self:Learner, item, rm_type_tfms=None, with_input=False):
    dl = self.dls.test_dl(item, rm_type_tfms=rm_type_tfms, num_workers=0)
    inp,preds,_,dec_preds = self.get_preds(dl=dl, with_input=True, with_decoded=True)
    i = getattr(self.dls, 'n_inp', -1)
    inp = (inp,) if i==1 else tuplify(inp)
    dec = self.dls.decode_batch(inp + tuplify(dec_preds))
    dec_inp,dec_targ = (tuple(map(detuplify, d)) for d in zip(*dec.map(lambda x: (x[:i], x[i:]))))
    res = dec_targ,dec_preds,preds
    if with_input: res = (dec_inp,) + res
    return res
```

Other notes h/t zach:

`learn.dls.vocab` or `learn.dls.categorize.vocab` is another way to get the class names.
