---
title: Remote Browser For Jupyter
description: fix the issue with lost connections to your remote kernel
---

## Background

It is very common to connect to a remote Jupyter server with your local browser.  However, if you lose connection with your remote server, logs printed to the screen may stop streaming.  This is common when training deep learning models where training runs can last days or weeks where progress bars are printed to the screen in a notebook.  

To avoid the issue with your browser loosing connection you can run the browser remotely on the same machine as the Jupyter server, even if your remote server does not have a desktop/GUI interface.

## fast.ai

The below youtube link (at timestamp 1:58:33), from fastai Lesson 10 Part 2 (2018) will walk you through how to accomplish this.

<iframe width="560" height="315" src="https://www.youtube.com/embed/h5Tz7gZT9Fo?start=7113" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

