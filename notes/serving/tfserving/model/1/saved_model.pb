њЭ
ЉЛ
D
AddV2
x"T
y"T
z"T"
Ttype:
2	АР
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( И
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
R
Einsum
inputs"T*N
output"T"
equationstring"
Nint(0"	
Ttype
Ѓ
GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"

batch_dimsint "
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
Н
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
Ж
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( И
?
Mul
x"T
y"T
z"T"
Ttype:
2	Р

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
Н
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
f
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx" 
Tidxtype0:
2
	
@
ReadVariableOp
resource
value"dtype"
dtypetypeИ
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
•
ResourceGather
resource
indices"Tindices
output"dtype"

batch_dimsint "
validate_indicesbool("
dtypetype"
Tindicestype:
2	И
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
.
Rsqrt
x"T
y"T"
Ttype:

2
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
G
SquaredDifference
x"T
y"T
z"T"
Ttype:

2	Р
Ѕ
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring И®
@
StaticRegexFullMatch	
input

output
"
patternstring
2
StopGradient

input"T
output"T"	
Ttype
ч
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
<
Sub
x"T
y"T
z"T"
Ttype:
2	
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	
Ц
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 И"serve*2.11.02v2.11.0-rc2-17-gd5b57ca93e58Ур
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
~
Adam/v/dense_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/v/dense_3/bias
w
'Adam/v/dense_3/bias/Read/ReadVariableOpReadVariableOpAdam/v/dense_3/bias*
_output_shapes
:*
dtype0
~
Adam/m/dense_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/m/dense_3/bias
w
'Adam/m/dense_3/bias/Read/ReadVariableOpReadVariableOpAdam/m/dense_3/bias*
_output_shapes
:*
dtype0
Ж
Adam/v/dense_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*&
shared_nameAdam/v/dense_3/kernel

)Adam/v/dense_3/kernel/Read/ReadVariableOpReadVariableOpAdam/v/dense_3/kernel*
_output_shapes

:*
dtype0
Ж
Adam/m/dense_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*&
shared_nameAdam/m/dense_3/kernel

)Adam/m/dense_3/kernel/Read/ReadVariableOpReadVariableOpAdam/m/dense_3/kernel*
_output_shapes

:*
dtype0
~
Adam/v/dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/v/dense_2/bias
w
'Adam/v/dense_2/bias/Read/ReadVariableOpReadVariableOpAdam/v/dense_2/bias*
_output_shapes
:*
dtype0
~
Adam/m/dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/m/dense_2/bias
w
'Adam/m/dense_2/bias/Read/ReadVariableOpReadVariableOpAdam/m/dense_2/bias*
_output_shapes
:*
dtype0
Ж
Adam/v/dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *&
shared_nameAdam/v/dense_2/kernel

)Adam/v/dense_2/kernel/Read/ReadVariableOpReadVariableOpAdam/v/dense_2/kernel*
_output_shapes

: *
dtype0
Ж
Adam/m/dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *&
shared_nameAdam/m/dense_2/kernel

)Adam/m/dense_2/kernel/Read/ReadVariableOpReadVariableOpAdam/m/dense_2/kernel*
_output_shapes

: *
dtype0
Њ
3Adam/v/transformer_block/layer_normalization_1/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *D
shared_name53Adam/v/transformer_block/layer_normalization_1/beta
Ј
GAdam/v/transformer_block/layer_normalization_1/beta/Read/ReadVariableOpReadVariableOp3Adam/v/transformer_block/layer_normalization_1/beta*
_output_shapes
: *
dtype0
Њ
3Adam/m/transformer_block/layer_normalization_1/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *D
shared_name53Adam/m/transformer_block/layer_normalization_1/beta
Ј
GAdam/m/transformer_block/layer_normalization_1/beta/Read/ReadVariableOpReadVariableOp3Adam/m/transformer_block/layer_normalization_1/beta*
_output_shapes
: *
dtype0
ј
4Adam/v/transformer_block/layer_normalization_1/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *E
shared_name64Adam/v/transformer_block/layer_normalization_1/gamma
є
HAdam/v/transformer_block/layer_normalization_1/gamma/Read/ReadVariableOpReadVariableOp4Adam/v/transformer_block/layer_normalization_1/gamma*
_output_shapes
: *
dtype0
ј
4Adam/m/transformer_block/layer_normalization_1/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *E
shared_name64Adam/m/transformer_block/layer_normalization_1/gamma
є
HAdam/m/transformer_block/layer_normalization_1/gamma/Read/ReadVariableOpReadVariableOp4Adam/m/transformer_block/layer_normalization_1/gamma*
_output_shapes
: *
dtype0
Ї
1Adam/v/transformer_block/layer_normalization/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *B
shared_name31Adam/v/transformer_block/layer_normalization/beta
≥
EAdam/v/transformer_block/layer_normalization/beta/Read/ReadVariableOpReadVariableOp1Adam/v/transformer_block/layer_normalization/beta*
_output_shapes
: *
dtype0
Ї
1Adam/m/transformer_block/layer_normalization/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *B
shared_name31Adam/m/transformer_block/layer_normalization/beta
≥
EAdam/m/transformer_block/layer_normalization/beta/Read/ReadVariableOpReadVariableOp1Adam/m/transformer_block/layer_normalization/beta*
_output_shapes
: *
dtype0
Љ
2Adam/v/transformer_block/layer_normalization/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *C
shared_name42Adam/v/transformer_block/layer_normalization/gamma
µ
FAdam/v/transformer_block/layer_normalization/gamma/Read/ReadVariableOpReadVariableOp2Adam/v/transformer_block/layer_normalization/gamma*
_output_shapes
: *
dtype0
Љ
2Adam/m/transformer_block/layer_normalization/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *C
shared_name42Adam/m/transformer_block/layer_normalization/gamma
µ
FAdam/m/transformer_block/layer_normalization/gamma/Read/ReadVariableOpReadVariableOp2Adam/m/transformer_block/layer_normalization/gamma*
_output_shapes
: *
dtype0
~
Adam/v/dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *$
shared_nameAdam/v/dense_1/bias
w
'Adam/v/dense_1/bias/Read/ReadVariableOpReadVariableOpAdam/v/dense_1/bias*
_output_shapes
: *
dtype0
~
Adam/m/dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *$
shared_nameAdam/m/dense_1/bias
w
'Adam/m/dense_1/bias/Read/ReadVariableOpReadVariableOpAdam/m/dense_1/bias*
_output_shapes
: *
dtype0
Ж
Adam/v/dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:  *&
shared_nameAdam/v/dense_1/kernel

)Adam/v/dense_1/kernel/Read/ReadVariableOpReadVariableOpAdam/v/dense_1/kernel*
_output_shapes

:  *
dtype0
Ж
Adam/m/dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:  *&
shared_nameAdam/m/dense_1/kernel

)Adam/m/dense_1/kernel/Read/ReadVariableOpReadVariableOpAdam/m/dense_1/kernel*
_output_shapes

:  *
dtype0
z
Adam/v/dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *"
shared_nameAdam/v/dense/bias
s
%Adam/v/dense/bias/Read/ReadVariableOpReadVariableOpAdam/v/dense/bias*
_output_shapes
: *
dtype0
z
Adam/m/dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *"
shared_nameAdam/m/dense/bias
s
%Adam/m/dense/bias/Read/ReadVariableOpReadVariableOpAdam/m/dense/bias*
_output_shapes
: *
dtype0
В
Adam/v/dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:  *$
shared_nameAdam/v/dense/kernel
{
'Adam/v/dense/kernel/Read/ReadVariableOpReadVariableOpAdam/v/dense/kernel*
_output_shapes

:  *
dtype0
В
Adam/m/dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:  *$
shared_nameAdam/m/dense/kernel
{
'Adam/m/dense/kernel/Read/ReadVariableOpReadVariableOpAdam/m/dense/kernel*
_output_shapes

:  *
dtype0
ё
CAdam/v/transformer_block/multi_head_attention/attention_output/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *T
shared_nameECAdam/v/transformer_block/multi_head_attention/attention_output/bias
„
WAdam/v/transformer_block/multi_head_attention/attention_output/bias/Read/ReadVariableOpReadVariableOpCAdam/v/transformer_block/multi_head_attention/attention_output/bias*
_output_shapes
: *
dtype0
ё
CAdam/m/transformer_block/multi_head_attention/attention_output/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *T
shared_nameECAdam/m/transformer_block/multi_head_attention/attention_output/bias
„
WAdam/m/transformer_block/multi_head_attention/attention_output/bias/Read/ReadVariableOpReadVariableOpCAdam/m/transformer_block/multi_head_attention/attention_output/bias*
_output_shapes
: *
dtype0
к
EAdam/v/transformer_block/multi_head_attention/attention_output/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *V
shared_nameGEAdam/v/transformer_block/multi_head_attention/attention_output/kernel
г
YAdam/v/transformer_block/multi_head_attention/attention_output/kernel/Read/ReadVariableOpReadVariableOpEAdam/v/transformer_block/multi_head_attention/attention_output/kernel*"
_output_shapes
:  *
dtype0
к
EAdam/m/transformer_block/multi_head_attention/attention_output/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *V
shared_nameGEAdam/m/transformer_block/multi_head_attention/attention_output/kernel
г
YAdam/m/transformer_block/multi_head_attention/attention_output/kernel/Read/ReadVariableOpReadVariableOpEAdam/m/transformer_block/multi_head_attention/attention_output/kernel*"
_output_shapes
:  *
dtype0
ћ
8Adam/v/transformer_block/multi_head_attention/value/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *I
shared_name:8Adam/v/transformer_block/multi_head_attention/value/bias
≈
LAdam/v/transformer_block/multi_head_attention/value/bias/Read/ReadVariableOpReadVariableOp8Adam/v/transformer_block/multi_head_attention/value/bias*
_output_shapes

: *
dtype0
ћ
8Adam/m/transformer_block/multi_head_attention/value/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *I
shared_name:8Adam/m/transformer_block/multi_head_attention/value/bias
≈
LAdam/m/transformer_block/multi_head_attention/value/bias/Read/ReadVariableOpReadVariableOp8Adam/m/transformer_block/multi_head_attention/value/bias*
_output_shapes

: *
dtype0
‘
:Adam/v/transformer_block/multi_head_attention/value/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *K
shared_name<:Adam/v/transformer_block/multi_head_attention/value/kernel
Ќ
NAdam/v/transformer_block/multi_head_attention/value/kernel/Read/ReadVariableOpReadVariableOp:Adam/v/transformer_block/multi_head_attention/value/kernel*"
_output_shapes
:  *
dtype0
‘
:Adam/m/transformer_block/multi_head_attention/value/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *K
shared_name<:Adam/m/transformer_block/multi_head_attention/value/kernel
Ќ
NAdam/m/transformer_block/multi_head_attention/value/kernel/Read/ReadVariableOpReadVariableOp:Adam/m/transformer_block/multi_head_attention/value/kernel*"
_output_shapes
:  *
dtype0
»
6Adam/v/transformer_block/multi_head_attention/key/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *G
shared_name86Adam/v/transformer_block/multi_head_attention/key/bias
Ѕ
JAdam/v/transformer_block/multi_head_attention/key/bias/Read/ReadVariableOpReadVariableOp6Adam/v/transformer_block/multi_head_attention/key/bias*
_output_shapes

: *
dtype0
»
6Adam/m/transformer_block/multi_head_attention/key/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *G
shared_name86Adam/m/transformer_block/multi_head_attention/key/bias
Ѕ
JAdam/m/transformer_block/multi_head_attention/key/bias/Read/ReadVariableOpReadVariableOp6Adam/m/transformer_block/multi_head_attention/key/bias*
_output_shapes

: *
dtype0
–
8Adam/v/transformer_block/multi_head_attention/key/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *I
shared_name:8Adam/v/transformer_block/multi_head_attention/key/kernel
…
LAdam/v/transformer_block/multi_head_attention/key/kernel/Read/ReadVariableOpReadVariableOp8Adam/v/transformer_block/multi_head_attention/key/kernel*"
_output_shapes
:  *
dtype0
–
8Adam/m/transformer_block/multi_head_attention/key/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *I
shared_name:8Adam/m/transformer_block/multi_head_attention/key/kernel
…
LAdam/m/transformer_block/multi_head_attention/key/kernel/Read/ReadVariableOpReadVariableOp8Adam/m/transformer_block/multi_head_attention/key/kernel*"
_output_shapes
:  *
dtype0
ћ
8Adam/v/transformer_block/multi_head_attention/query/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *I
shared_name:8Adam/v/transformer_block/multi_head_attention/query/bias
≈
LAdam/v/transformer_block/multi_head_attention/query/bias/Read/ReadVariableOpReadVariableOp8Adam/v/transformer_block/multi_head_attention/query/bias*
_output_shapes

: *
dtype0
ћ
8Adam/m/transformer_block/multi_head_attention/query/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *I
shared_name:8Adam/m/transformer_block/multi_head_attention/query/bias
≈
LAdam/m/transformer_block/multi_head_attention/query/bias/Read/ReadVariableOpReadVariableOp8Adam/m/transformer_block/multi_head_attention/query/bias*
_output_shapes

: *
dtype0
‘
:Adam/v/transformer_block/multi_head_attention/query/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *K
shared_name<:Adam/v/transformer_block/multi_head_attention/query/kernel
Ќ
NAdam/v/transformer_block/multi_head_attention/query/kernel/Read/ReadVariableOpReadVariableOp:Adam/v/transformer_block/multi_head_attention/query/kernel*"
_output_shapes
:  *
dtype0
‘
:Adam/m/transformer_block/multi_head_attention/query/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *K
shared_name<:Adam/m/transformer_block/multi_head_attention/query/kernel
Ќ
NAdam/m/transformer_block/multi_head_attention/query/kernel/Read/ReadVariableOpReadVariableOp:Adam/m/transformer_block/multi_head_attention/query/kernel*"
_output_shapes
:  *
dtype0
—
:Adam/v/token_and_position_embedding/embedding_1/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:	» *K
shared_name<:Adam/v/token_and_position_embedding/embedding_1/embeddings
 
NAdam/v/token_and_position_embedding/embedding_1/embeddings/Read/ReadVariableOpReadVariableOp:Adam/v/token_and_position_embedding/embedding_1/embeddings*
_output_shapes
:	» *
dtype0
—
:Adam/m/token_and_position_embedding/embedding_1/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:	» *K
shared_name<:Adam/m/token_and_position_embedding/embedding_1/embeddings
 
NAdam/m/token_and_position_embedding/embedding_1/embeddings/Read/ReadVariableOpReadVariableOp:Adam/m/token_and_position_embedding/embedding_1/embeddings*
_output_shapes
:	» *
dtype0
ќ
8Adam/v/token_and_position_embedding/embedding/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:
†Ь *I
shared_name:8Adam/v/token_and_position_embedding/embedding/embeddings
«
LAdam/v/token_and_position_embedding/embedding/embeddings/Read/ReadVariableOpReadVariableOp8Adam/v/token_and_position_embedding/embedding/embeddings* 
_output_shapes
:
†Ь *
dtype0
ќ
8Adam/m/token_and_position_embedding/embedding/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:
†Ь *I
shared_name:8Adam/m/token_and_position_embedding/embedding/embeddings
«
LAdam/m/token_and_position_embedding/embedding/embeddings/Read/ReadVariableOpReadVariableOp8Adam/m/token_and_position_embedding/embedding/embeddings* 
_output_shapes
:
†Ь *
dtype0
n
learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namelearning_rate
g
!learning_rate/Read/ReadVariableOpReadVariableOplearning_rate*
_output_shapes
: *
dtype0
f
	iterationVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	iteration
_
iteration/Read/ReadVariableOpReadVariableOp	iteration*
_output_shapes
: *
dtype0	
∞
,transformer_block/layer_normalization_1/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *=
shared_name.,transformer_block/layer_normalization_1/beta
©
@transformer_block/layer_normalization_1/beta/Read/ReadVariableOpReadVariableOp,transformer_block/layer_normalization_1/beta*
_output_shapes
: *
dtype0
≤
-transformer_block/layer_normalization_1/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *>
shared_name/-transformer_block/layer_normalization_1/gamma
Ђ
Atransformer_block/layer_normalization_1/gamma/Read/ReadVariableOpReadVariableOp-transformer_block/layer_normalization_1/gamma*
_output_shapes
: *
dtype0
ђ
*transformer_block/layer_normalization/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *;
shared_name,*transformer_block/layer_normalization/beta
•
>transformer_block/layer_normalization/beta/Read/ReadVariableOpReadVariableOp*transformer_block/layer_normalization/beta*
_output_shapes
: *
dtype0
Ѓ
+transformer_block/layer_normalization/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *<
shared_name-+transformer_block/layer_normalization/gamma
І
?transformer_block/layer_normalization/gamma/Read/ReadVariableOpReadVariableOp+transformer_block/layer_normalization/gamma*
_output_shapes
: *
dtype0
p
dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namedense_1/bias
i
 dense_1/bias/Read/ReadVariableOpReadVariableOpdense_1/bias*
_output_shapes
: *
dtype0
x
dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:  *
shared_namedense_1/kernel
q
"dense_1/kernel/Read/ReadVariableOpReadVariableOpdense_1/kernel*
_output_shapes

:  *
dtype0
l

dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
dense/bias
e
dense/bias/Read/ReadVariableOpReadVariableOp
dense/bias*
_output_shapes
: *
dtype0
t
dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:  *
shared_namedense/kernel
m
 dense/kernel/Read/ReadVariableOpReadVariableOpdense/kernel*
_output_shapes

:  *
dtype0
–
<transformer_block/multi_head_attention/attention_output/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *M
shared_name><transformer_block/multi_head_attention/attention_output/bias
…
Ptransformer_block/multi_head_attention/attention_output/bias/Read/ReadVariableOpReadVariableOp<transformer_block/multi_head_attention/attention_output/bias*
_output_shapes
: *
dtype0
№
>transformer_block/multi_head_attention/attention_output/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *O
shared_name@>transformer_block/multi_head_attention/attention_output/kernel
’
Rtransformer_block/multi_head_attention/attention_output/kernel/Read/ReadVariableOpReadVariableOp>transformer_block/multi_head_attention/attention_output/kernel*"
_output_shapes
:  *
dtype0
Њ
1transformer_block/multi_head_attention/value/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *B
shared_name31transformer_block/multi_head_attention/value/bias
Ј
Etransformer_block/multi_head_attention/value/bias/Read/ReadVariableOpReadVariableOp1transformer_block/multi_head_attention/value/bias*
_output_shapes

: *
dtype0
∆
3transformer_block/multi_head_attention/value/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *D
shared_name53transformer_block/multi_head_attention/value/kernel
њ
Gtransformer_block/multi_head_attention/value/kernel/Read/ReadVariableOpReadVariableOp3transformer_block/multi_head_attention/value/kernel*"
_output_shapes
:  *
dtype0
Ї
/transformer_block/multi_head_attention/key/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *@
shared_name1/transformer_block/multi_head_attention/key/bias
≥
Ctransformer_block/multi_head_attention/key/bias/Read/ReadVariableOpReadVariableOp/transformer_block/multi_head_attention/key/bias*
_output_shapes

: *
dtype0
¬
1transformer_block/multi_head_attention/key/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *B
shared_name31transformer_block/multi_head_attention/key/kernel
ї
Etransformer_block/multi_head_attention/key/kernel/Read/ReadVariableOpReadVariableOp1transformer_block/multi_head_attention/key/kernel*"
_output_shapes
:  *
dtype0
Њ
1transformer_block/multi_head_attention/query/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *B
shared_name31transformer_block/multi_head_attention/query/bias
Ј
Etransformer_block/multi_head_attention/query/bias/Read/ReadVariableOpReadVariableOp1transformer_block/multi_head_attention/query/bias*
_output_shapes

: *
dtype0
∆
3transformer_block/multi_head_attention/query/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *D
shared_name53transformer_block/multi_head_attention/query/kernel
њ
Gtransformer_block/multi_head_attention/query/kernel/Read/ReadVariableOpReadVariableOp3transformer_block/multi_head_attention/query/kernel*"
_output_shapes
:  *
dtype0
√
3token_and_position_embedding/embedding_1/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:	» *D
shared_name53token_and_position_embedding/embedding_1/embeddings
Љ
Gtoken_and_position_embedding/embedding_1/embeddings/Read/ReadVariableOpReadVariableOp3token_and_position_embedding/embedding_1/embeddings*
_output_shapes
:	» *
dtype0
ј
1token_and_position_embedding/embedding/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:
†Ь *B
shared_name31token_and_position_embedding/embedding/embeddings
є
Etoken_and_position_embedding/embedding/embeddings/Read/ReadVariableOpReadVariableOp1token_and_position_embedding/embedding/embeddings* 
_output_shapes
:
†Ь *
dtype0
p
dense_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_3/bias
i
 dense_3/bias/Read/ReadVariableOpReadVariableOpdense_3/bias*
_output_shapes
:*
dtype0
x
dense_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*
shared_namedense_3/kernel
q
"dense_3/kernel/Read/ReadVariableOpReadVariableOpdense_3/kernel*
_output_shapes

:*
dtype0
p
dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_2/bias
i
 dense_2/bias/Read/ReadVariableOpReadVariableOpdense_2/bias*
_output_shapes
:*
dtype0
x
dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *
shared_namedense_2/kernel
q
"dense_2/kernel/Read/ReadVariableOpReadVariableOpdense_2/kernel*
_output_shapes

: *
dtype0
|
serving_default_input_1Placeholder*(
_output_shapes
:€€€€€€€€€»*
dtype0*
shape:€€€€€€€€€»
§	
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_13token_and_position_embedding/embedding_1/embeddings1token_and_position_embedding/embedding/embeddings3transformer_block/multi_head_attention/query/kernel1transformer_block/multi_head_attention/query/bias1transformer_block/multi_head_attention/key/kernel/transformer_block/multi_head_attention/key/bias3transformer_block/multi_head_attention/value/kernel1transformer_block/multi_head_attention/value/bias>transformer_block/multi_head_attention/attention_output/kernel<transformer_block/multi_head_attention/attention_output/bias+transformer_block/layer_normalization/gamma*transformer_block/layer_normalization/betadense/kernel
dense/biasdense_1/kerneldense_1/bias-transformer_block/layer_normalization_1/gamma,transformer_block/layer_normalization_1/betadense_2/kerneldense_2/biasdense_3/kerneldense_3/bias*"
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*8
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *,
f'R%
#__inference_signature_wrapper_17572

NoOpNoOp
Ыј
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*’њ
value њB∆њ BЊњ
Ь
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer-3
layer-4
layer_with_weights-2
layer-5
layer-6
layer_with_weights-3
layer-7
		variables

trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures*
* 
ђ
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
	token_emb
pos_emb*
ё
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
 att
!ffn
"
layernorm1
#
layernorm2
$dropout1
%dropout2*
О
&	variables
'trainable_variables
(regularization_losses
)	keras_api
*__call__
*+&call_and_return_all_conditional_losses* 
•
,	variables
-trainable_variables
.regularization_losses
/	keras_api
0__call__
*1&call_and_return_all_conditional_losses
2_random_generator* 
¶
3	variables
4trainable_variables
5regularization_losses
6	keras_api
7__call__
*8&call_and_return_all_conditional_losses

9kernel
:bias*
•
;	variables
<trainable_variables
=regularization_losses
>	keras_api
?__call__
*@&call_and_return_all_conditional_losses
A_random_generator* 
¶
B	variables
Ctrainable_variables
Dregularization_losses
E	keras_api
F__call__
*G&call_and_return_all_conditional_losses

Hkernel
Ibias*
™
J0
K1
L2
M3
N4
O5
P6
Q7
R8
S9
T10
U11
V12
W13
X14
Y15
Z16
[17
918
:19
H20
I21*
™
J0
K1
L2
M3
N4
O5
P6
Q7
R8
S9
T10
U11
V12
W13
X14
Y15
Z16
[17
918
:19
H20
I21*
* 
∞
\non_trainable_variables

]layers
^metrics
_layer_regularization_losses
`layer_metrics
		variables

trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
6
atrace_0
btrace_1
ctrace_2
dtrace_3* 
6
etrace_0
ftrace_1
gtrace_2
htrace_3* 
* 
Б
i
_variables
j_iterations
k_learning_rate
l_index_dict
m
_momentums
n_velocities
o_update_step_xla*

pserving_default* 

J0
K1*

J0
K1*
* 
У
qnon_trainable_variables

rlayers
smetrics
tlayer_regularization_losses
ulayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

vtrace_0* 

wtrace_0* 
†
x	variables
ytrainable_variables
zregularization_losses
{	keras_api
|__call__
*}&call_and_return_all_conditional_losses
J
embeddings*
§
~	variables
trainable_variables
Аregularization_losses
Б	keras_api
В__call__
+Г&call_and_return_all_conditional_losses
K
embeddings*
z
L0
M1
N2
O3
P4
Q5
R6
S7
T8
U9
V10
W11
X12
Y13
Z14
[15*
z
L0
M1
N2
O3
P4
Q5
R6
S7
T8
U9
V10
W11
X12
Y13
Z14
[15*
* 
Ш
Дnon_trainable_variables
Еlayers
Жmetrics
 Зlayer_regularization_losses
Иlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

Йtrace_0
Кtrace_1* 

Лtrace_0
Мtrace_1* 
Е
Н	variables
Оtrainable_variables
Пregularization_losses
Р	keras_api
С__call__
+Т&call_and_return_all_conditional_losses
У_query_dense
Ф
_key_dense
Х_value_dense
Ц_softmax
Ч_dropout_layer
Ш_output_dense*
и
Щlayer_with_weights-0
Щlayer-0
Ъlayer_with_weights-1
Ъlayer-1
Ы	variables
Ьtrainable_variables
Эregularization_losses
Ю	keras_api
Я__call__
+†&call_and_return_all_conditional_losses*
ґ
°	variables
Ґtrainable_variables
£regularization_losses
§	keras_api
•__call__
+¶&call_and_return_all_conditional_losses
	Іaxis
	Xgamma
Ybeta*
ґ
®	variables
©trainable_variables
™regularization_losses
Ђ	keras_api
ђ__call__
+≠&call_and_return_all_conditional_losses
	Ѓaxis
	Zgamma
[beta*
ђ
ѓ	variables
∞trainable_variables
±regularization_losses
≤	keras_api
≥__call__
+і&call_and_return_all_conditional_losses
µ_random_generator* 
ђ
ґ	variables
Јtrainable_variables
Єregularization_losses
є	keras_api
Ї__call__
+ї&call_and_return_all_conditional_losses
Љ_random_generator* 
* 
* 
* 
Ц
љnon_trainable_variables
Њlayers
њmetrics
 јlayer_regularization_losses
Ѕlayer_metrics
&	variables
'trainable_variables
(regularization_losses
*__call__
*+&call_and_return_all_conditional_losses
&+"call_and_return_conditional_losses* 

¬trace_0* 

√trace_0* 
* 
* 
* 
Ц
ƒnon_trainable_variables
≈layers
∆metrics
 «layer_regularization_losses
»layer_metrics
,	variables
-trainable_variables
.regularization_losses
0__call__
*1&call_and_return_all_conditional_losses
&1"call_and_return_conditional_losses* 

…trace_0
 trace_1* 

Ћtrace_0
ћtrace_1* 
* 

90
:1*

90
:1*
* 
Ш
Ќnon_trainable_variables
ќlayers
ѕmetrics
 –layer_regularization_losses
—layer_metrics
3	variables
4trainable_variables
5regularization_losses
7__call__
*8&call_and_return_all_conditional_losses
&8"call_and_return_conditional_losses*

“trace_0* 

”trace_0* 
^X
VARIABLE_VALUEdense_2/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEdense_2/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
Ц
‘non_trainable_variables
’layers
÷metrics
 „layer_regularization_losses
Ўlayer_metrics
;	variables
<trainable_variables
=regularization_losses
?__call__
*@&call_and_return_all_conditional_losses
&@"call_and_return_conditional_losses* 

ўtrace_0
Џtrace_1* 

џtrace_0
№trace_1* 
* 

H0
I1*

H0
I1*
* 
Ш
Ёnon_trainable_variables
ёlayers
яmetrics
 аlayer_regularization_losses
бlayer_metrics
B	variables
Ctrainable_variables
Dregularization_losses
F__call__
*G&call_and_return_all_conditional_losses
&G"call_and_return_conditional_losses*

вtrace_0* 

гtrace_0* 
^X
VARIABLE_VALUEdense_3/kernel6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEdense_3/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE*
qk
VARIABLE_VALUE1token_and_position_embedding/embedding/embeddings&variables/0/.ATTRIBUTES/VARIABLE_VALUE*
sm
VARIABLE_VALUE3token_and_position_embedding/embedding_1/embeddings&variables/1/.ATTRIBUTES/VARIABLE_VALUE*
sm
VARIABLE_VALUE3transformer_block/multi_head_attention/query/kernel&variables/2/.ATTRIBUTES/VARIABLE_VALUE*
qk
VARIABLE_VALUE1transformer_block/multi_head_attention/query/bias&variables/3/.ATTRIBUTES/VARIABLE_VALUE*
qk
VARIABLE_VALUE1transformer_block/multi_head_attention/key/kernel&variables/4/.ATTRIBUTES/VARIABLE_VALUE*
oi
VARIABLE_VALUE/transformer_block/multi_head_attention/key/bias&variables/5/.ATTRIBUTES/VARIABLE_VALUE*
sm
VARIABLE_VALUE3transformer_block/multi_head_attention/value/kernel&variables/6/.ATTRIBUTES/VARIABLE_VALUE*
qk
VARIABLE_VALUE1transformer_block/multi_head_attention/value/bias&variables/7/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUE>transformer_block/multi_head_attention/attention_output/kernel&variables/8/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUE<transformer_block/multi_head_attention/attention_output/bias&variables/9/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEdense/kernel'variables/10/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUE
dense/bias'variables/11/.ATTRIBUTES/VARIABLE_VALUE*
OI
VARIABLE_VALUEdense_1/kernel'variables/12/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEdense_1/bias'variables/13/.ATTRIBUTES/VARIABLE_VALUE*
lf
VARIABLE_VALUE+transformer_block/layer_normalization/gamma'variables/14/.ATTRIBUTES/VARIABLE_VALUE*
ke
VARIABLE_VALUE*transformer_block/layer_normalization/beta'variables/15/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUE-transformer_block/layer_normalization_1/gamma'variables/16/.ATTRIBUTES/VARIABLE_VALUE*
mg
VARIABLE_VALUE,transformer_block/layer_normalization_1/beta'variables/17/.ATTRIBUTES/VARIABLE_VALUE*
* 
<
0
1
2
3
4
5
6
7*

д0
е1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
О
j0
ж1
з2
и3
й4
к5
л6
м7
н8
о9
п10
р11
с12
т13
у14
ф15
х16
ц17
ч18
ш19
щ20
ъ21
ы22
ь23
э24
ю25
€26
А27
Б28
В29
Г30
Д31
Е32
Ж33
З34
И35
Й36
К37
Л38
М39
Н40
О41
П42
Р43
С44*
SM
VARIABLE_VALUE	iteration0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUElearning_rate3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 
ј
ж0
и1
к2
м3
о4
р5
т6
ф7
ц8
ш9
ъ10
ь11
ю12
А13
В14
Д15
Ж16
И17
К18
М19
О20
Р21*
ј
з0
й1
л2
н3
п4
с5
у6
х7
ч8
щ9
ы10
э11
€12
Б13
Г14
Е15
З16
Й17
Л18
Н19
П20
С21*
¬
Тtrace_0
Уtrace_1
Фtrace_2
Хtrace_3
Цtrace_4
Чtrace_5
Шtrace_6
Щtrace_7
Ъtrace_8
Ыtrace_9
Ьtrace_10
Эtrace_11
Юtrace_12
Яtrace_13
†trace_14
°trace_15
Ґtrace_16
£trace_17
§trace_18
•trace_19
¶trace_20
Іtrace_21* 
* 
* 

0
1*
* 
* 
* 
* 
* 

J0*

J0*
* 
Ш
®non_trainable_variables
©layers
™metrics
 Ђlayer_regularization_losses
ђlayer_metrics
x	variables
ytrainable_variables
zregularization_losses
|__call__
*}&call_and_return_all_conditional_losses
&}"call_and_return_conditional_losses*
* 
* 

K0*

K0*
* 
Ь
≠non_trainable_variables
Ѓlayers
ѓmetrics
 ∞layer_regularization_losses
±layer_metrics
~	variables
trainable_variables
Аregularization_losses
В__call__
+Г&call_and_return_all_conditional_losses
'Г"call_and_return_conditional_losses*
* 
* 
* 
.
 0
!1
"2
#3
$4
%5*
* 
* 
* 
* 
* 
* 
* 
<
L0
M1
N2
O3
P4
Q5
R6
S7*
<
L0
M1
N2
O3
P4
Q5
R6
S7*
* 
Ю
≤non_trainable_variables
≥layers
іmetrics
 µlayer_regularization_losses
ґlayer_metrics
Н	variables
Оtrainable_variables
Пregularization_losses
С__call__
+Т&call_and_return_all_conditional_losses
'Т"call_and_return_conditional_losses*
* 
* 
я
Ј	variables
Єtrainable_variables
єregularization_losses
Ї	keras_api
ї__call__
+Љ&call_and_return_all_conditional_losses
љpartial_output_shape
Њfull_output_shape

Lkernel
Mbias*
я
њ	variables
јtrainable_variables
Ѕregularization_losses
¬	keras_api
√__call__
+ƒ&call_and_return_all_conditional_losses
≈partial_output_shape
∆full_output_shape

Nkernel
Obias*
я
«	variables
»trainable_variables
…regularization_losses
 	keras_api
Ћ__call__
+ћ&call_and_return_all_conditional_losses
Ќpartial_output_shape
ќfull_output_shape

Pkernel
Qbias*
Ф
ѕ	variables
–trainable_variables
—regularization_losses
“	keras_api
”__call__
+‘&call_and_return_all_conditional_losses* 
ђ
’	variables
÷trainable_variables
„regularization_losses
Ў	keras_api
ў__call__
+Џ&call_and_return_all_conditional_losses
џ_random_generator* 
я
№	variables
Ёtrainable_variables
ёregularization_losses
я	keras_api
а__call__
+б&call_and_return_all_conditional_losses
вpartial_output_shape
гfull_output_shape

Rkernel
Sbias*
ђ
д	variables
еtrainable_variables
жregularization_losses
з	keras_api
и__call__
+й&call_and_return_all_conditional_losses

Tkernel
Ubias*
ђ
к	variables
лtrainable_variables
мregularization_losses
н	keras_api
о__call__
+п&call_and_return_all_conditional_losses

Vkernel
Wbias*
 
T0
U1
V2
W3*
 
T0
U1
V2
W3*
* 
Ю
рnon_trainable_variables
сlayers
тmetrics
 уlayer_regularization_losses
фlayer_metrics
Ы	variables
Ьtrainable_variables
Эregularization_losses
Я__call__
+†&call_and_return_all_conditional_losses
'†"call_and_return_conditional_losses*
:
хtrace_0
цtrace_1
чtrace_2
шtrace_3* 
:
щtrace_0
ъtrace_1
ыtrace_2
ьtrace_3* 

X0
Y1*

X0
Y1*
* 
Ю
эnon_trainable_variables
юlayers
€metrics
 Аlayer_regularization_losses
Бlayer_metrics
°	variables
Ґtrainable_variables
£regularization_losses
•__call__
+¶&call_and_return_all_conditional_losses
'¶"call_and_return_conditional_losses*
* 
* 
* 

Z0
[1*

Z0
[1*
* 
Ю
Вnon_trainable_variables
Гlayers
Дmetrics
 Еlayer_regularization_losses
Жlayer_metrics
®	variables
©trainable_variables
™regularization_losses
ђ__call__
+≠&call_and_return_all_conditional_losses
'≠"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
* 
Ь
Зnon_trainable_variables
Иlayers
Йmetrics
 Кlayer_regularization_losses
Лlayer_metrics
ѓ	variables
∞trainable_variables
±regularization_losses
≥__call__
+і&call_and_return_all_conditional_losses
'і"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 
* 
Ь
Мnon_trainable_variables
Нlayers
Оmetrics
 Пlayer_regularization_losses
Рlayer_metrics
ґ	variables
Јtrainable_variables
Єregularization_losses
Ї__call__
+ї&call_and_return_all_conditional_losses
'ї"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
<
С	variables
Т	keras_api

Уtotal

Фcount*
M
Х	variables
Ц	keras_api

Чtotal

Шcount
Щ
_fn_kwargs*
Г}
VARIABLE_VALUE8Adam/m/token_and_position_embedding/embedding/embeddings1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUE*
Г}
VARIABLE_VALUE8Adam/v/token_and_position_embedding/embedding/embeddings1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUE*
Е
VARIABLE_VALUE:Adam/m/token_and_position_embedding/embedding_1/embeddings1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUE*
Е
VARIABLE_VALUE:Adam/v/token_and_position_embedding/embedding_1/embeddings1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUE*
Е
VARIABLE_VALUE:Adam/m/transformer_block/multi_head_attention/query/kernel1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUE*
Е
VARIABLE_VALUE:Adam/v/transformer_block/multi_head_attention/query/kernel1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUE*
Г}
VARIABLE_VALUE8Adam/m/transformer_block/multi_head_attention/query/bias1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUE*
Г}
VARIABLE_VALUE8Adam/v/transformer_block/multi_head_attention/query/bias1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUE*
Г}
VARIABLE_VALUE8Adam/m/transformer_block/multi_head_attention/key/kernel1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUE*
Д~
VARIABLE_VALUE8Adam/v/transformer_block/multi_head_attention/key/kernel2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUE*
В|
VARIABLE_VALUE6Adam/m/transformer_block/multi_head_attention/key/bias2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUE*
В|
VARIABLE_VALUE6Adam/v/transformer_block/multi_head_attention/key/bias2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUE*
ЗА
VARIABLE_VALUE:Adam/m/transformer_block/multi_head_attention/value/kernel2optimizer/_variables/13/.ATTRIBUTES/VARIABLE_VALUE*
ЗА
VARIABLE_VALUE:Adam/v/transformer_block/multi_head_attention/value/kernel2optimizer/_variables/14/.ATTRIBUTES/VARIABLE_VALUE*
Д~
VARIABLE_VALUE8Adam/m/transformer_block/multi_head_attention/value/bias2optimizer/_variables/15/.ATTRIBUTES/VARIABLE_VALUE*
Д~
VARIABLE_VALUE8Adam/v/transformer_block/multi_head_attention/value/bias2optimizer/_variables/16/.ATTRIBUTES/VARIABLE_VALUE*
ТЛ
VARIABLE_VALUEEAdam/m/transformer_block/multi_head_attention/attention_output/kernel2optimizer/_variables/17/.ATTRIBUTES/VARIABLE_VALUE*
ТЛ
VARIABLE_VALUEEAdam/v/transformer_block/multi_head_attention/attention_output/kernel2optimizer/_variables/18/.ATTRIBUTES/VARIABLE_VALUE*
РЙ
VARIABLE_VALUECAdam/m/transformer_block/multi_head_attention/attention_output/bias2optimizer/_variables/19/.ATTRIBUTES/VARIABLE_VALUE*
РЙ
VARIABLE_VALUECAdam/v/transformer_block/multi_head_attention/attention_output/bias2optimizer/_variables/20/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEAdam/m/dense/kernel2optimizer/_variables/21/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEAdam/v/dense/kernel2optimizer/_variables/22/.ATTRIBUTES/VARIABLE_VALUE*
]W
VARIABLE_VALUEAdam/m/dense/bias2optimizer/_variables/23/.ATTRIBUTES/VARIABLE_VALUE*
]W
VARIABLE_VALUEAdam/v/dense/bias2optimizer/_variables/24/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUEAdam/m/dense_1/kernel2optimizer/_variables/25/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUEAdam/v/dense_1/kernel2optimizer/_variables/26/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEAdam/m/dense_1/bias2optimizer/_variables/27/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEAdam/v/dense_1/bias2optimizer/_variables/28/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUE2Adam/m/transformer_block/layer_normalization/gamma2optimizer/_variables/29/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUE2Adam/v/transformer_block/layer_normalization/gamma2optimizer/_variables/30/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUE1Adam/m/transformer_block/layer_normalization/beta2optimizer/_variables/31/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUE1Adam/v/transformer_block/layer_normalization/beta2optimizer/_variables/32/.ATTRIBUTES/VARIABLE_VALUE*
Аz
VARIABLE_VALUE4Adam/m/transformer_block/layer_normalization_1/gamma2optimizer/_variables/33/.ATTRIBUTES/VARIABLE_VALUE*
Аz
VARIABLE_VALUE4Adam/v/transformer_block/layer_normalization_1/gamma2optimizer/_variables/34/.ATTRIBUTES/VARIABLE_VALUE*
y
VARIABLE_VALUE3Adam/m/transformer_block/layer_normalization_1/beta2optimizer/_variables/35/.ATTRIBUTES/VARIABLE_VALUE*
y
VARIABLE_VALUE3Adam/v/transformer_block/layer_normalization_1/beta2optimizer/_variables/36/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUEAdam/m/dense_2/kernel2optimizer/_variables/37/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUEAdam/v/dense_2/kernel2optimizer/_variables/38/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEAdam/m/dense_2/bias2optimizer/_variables/39/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEAdam/v/dense_2/bias2optimizer/_variables/40/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUEAdam/m/dense_3/kernel2optimizer/_variables/41/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUEAdam/v/dense_3/kernel2optimizer/_variables/42/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEAdam/m/dense_3/bias2optimizer/_variables/43/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEAdam/v/dense_3/bias2optimizer/_variables/44/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
4
У0
Ф1
Х2
Ц3
Ч4
Ш5*
* 
* 
* 

L0
M1*

L0
M1*
* 
Ю
Ъnon_trainable_variables
Ыlayers
Ьmetrics
 Эlayer_regularization_losses
Юlayer_metrics
Ј	variables
Єtrainable_variables
єregularization_losses
ї__call__
+Љ&call_and_return_all_conditional_losses
'Љ"call_and_return_conditional_losses*
* 
* 
* 
* 

N0
O1*

N0
O1*
* 
Ю
Яnon_trainable_variables
†layers
°metrics
 Ґlayer_regularization_losses
£layer_metrics
њ	variables
јtrainable_variables
Ѕregularization_losses
√__call__
+ƒ&call_and_return_all_conditional_losses
'ƒ"call_and_return_conditional_losses*
* 
* 
* 
* 

P0
Q1*

P0
Q1*
* 
Ю
§non_trainable_variables
•layers
¶metrics
 Іlayer_regularization_losses
®layer_metrics
«	variables
»trainable_variables
…regularization_losses
Ћ__call__
+ћ&call_and_return_all_conditional_losses
'ћ"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
* 
* 
Ь
©non_trainable_variables
™layers
Ђmetrics
 ђlayer_regularization_losses
≠layer_metrics
ѕ	variables
–trainable_variables
—regularization_losses
”__call__
+‘&call_and_return_all_conditional_losses
'‘"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 
Ь
Ѓnon_trainable_variables
ѓlayers
∞metrics
 ±layer_regularization_losses
≤layer_metrics
’	variables
÷trainable_variables
„regularization_losses
ў__call__
+Џ&call_and_return_all_conditional_losses
'Џ"call_and_return_conditional_losses* 
* 
* 
* 

R0
S1*

R0
S1*
* 
Ю
≥non_trainable_variables
іlayers
µmetrics
 ґlayer_regularization_losses
Јlayer_metrics
№	variables
Ёtrainable_variables
ёregularization_losses
а__call__
+б&call_and_return_all_conditional_losses
'б"call_and_return_conditional_losses*
* 
* 
* 
* 

T0
U1*

T0
U1*
* 
Ю
Єnon_trainable_variables
єlayers
Їmetrics
 їlayer_regularization_losses
Љlayer_metrics
д	variables
еtrainable_variables
жregularization_losses
и__call__
+й&call_and_return_all_conditional_losses
'й"call_and_return_conditional_losses*

љtrace_0* 

Њtrace_0* 

V0
W1*

V0
W1*
* 
Ю
њnon_trainable_variables
јlayers
Ѕmetrics
 ¬layer_regularization_losses
√layer_metrics
к	variables
лtrainable_variables
мregularization_losses
о__call__
+п&call_and_return_all_conditional_losses
'п"call_and_return_conditional_losses*

ƒtrace_0* 

≈trace_0* 
* 

Щ0
Ъ1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

У0
Ф1*

С	variables*
UO
VARIABLE_VALUEtotal_14keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEcount_14keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*

Ч0
Ш1*

Х	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
њ$
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename"dense_2/kernel/Read/ReadVariableOp dense_2/bias/Read/ReadVariableOp"dense_3/kernel/Read/ReadVariableOp dense_3/bias/Read/ReadVariableOpEtoken_and_position_embedding/embedding/embeddings/Read/ReadVariableOpGtoken_and_position_embedding/embedding_1/embeddings/Read/ReadVariableOpGtransformer_block/multi_head_attention/query/kernel/Read/ReadVariableOpEtransformer_block/multi_head_attention/query/bias/Read/ReadVariableOpEtransformer_block/multi_head_attention/key/kernel/Read/ReadVariableOpCtransformer_block/multi_head_attention/key/bias/Read/ReadVariableOpGtransformer_block/multi_head_attention/value/kernel/Read/ReadVariableOpEtransformer_block/multi_head_attention/value/bias/Read/ReadVariableOpRtransformer_block/multi_head_attention/attention_output/kernel/Read/ReadVariableOpPtransformer_block/multi_head_attention/attention_output/bias/Read/ReadVariableOp dense/kernel/Read/ReadVariableOpdense/bias/Read/ReadVariableOp"dense_1/kernel/Read/ReadVariableOp dense_1/bias/Read/ReadVariableOp?transformer_block/layer_normalization/gamma/Read/ReadVariableOp>transformer_block/layer_normalization/beta/Read/ReadVariableOpAtransformer_block/layer_normalization_1/gamma/Read/ReadVariableOp@transformer_block/layer_normalization_1/beta/Read/ReadVariableOpiteration/Read/ReadVariableOp!learning_rate/Read/ReadVariableOpLAdam/m/token_and_position_embedding/embedding/embeddings/Read/ReadVariableOpLAdam/v/token_and_position_embedding/embedding/embeddings/Read/ReadVariableOpNAdam/m/token_and_position_embedding/embedding_1/embeddings/Read/ReadVariableOpNAdam/v/token_and_position_embedding/embedding_1/embeddings/Read/ReadVariableOpNAdam/m/transformer_block/multi_head_attention/query/kernel/Read/ReadVariableOpNAdam/v/transformer_block/multi_head_attention/query/kernel/Read/ReadVariableOpLAdam/m/transformer_block/multi_head_attention/query/bias/Read/ReadVariableOpLAdam/v/transformer_block/multi_head_attention/query/bias/Read/ReadVariableOpLAdam/m/transformer_block/multi_head_attention/key/kernel/Read/ReadVariableOpLAdam/v/transformer_block/multi_head_attention/key/kernel/Read/ReadVariableOpJAdam/m/transformer_block/multi_head_attention/key/bias/Read/ReadVariableOpJAdam/v/transformer_block/multi_head_attention/key/bias/Read/ReadVariableOpNAdam/m/transformer_block/multi_head_attention/value/kernel/Read/ReadVariableOpNAdam/v/transformer_block/multi_head_attention/value/kernel/Read/ReadVariableOpLAdam/m/transformer_block/multi_head_attention/value/bias/Read/ReadVariableOpLAdam/v/transformer_block/multi_head_attention/value/bias/Read/ReadVariableOpYAdam/m/transformer_block/multi_head_attention/attention_output/kernel/Read/ReadVariableOpYAdam/v/transformer_block/multi_head_attention/attention_output/kernel/Read/ReadVariableOpWAdam/m/transformer_block/multi_head_attention/attention_output/bias/Read/ReadVariableOpWAdam/v/transformer_block/multi_head_attention/attention_output/bias/Read/ReadVariableOp'Adam/m/dense/kernel/Read/ReadVariableOp'Adam/v/dense/kernel/Read/ReadVariableOp%Adam/m/dense/bias/Read/ReadVariableOp%Adam/v/dense/bias/Read/ReadVariableOp)Adam/m/dense_1/kernel/Read/ReadVariableOp)Adam/v/dense_1/kernel/Read/ReadVariableOp'Adam/m/dense_1/bias/Read/ReadVariableOp'Adam/v/dense_1/bias/Read/ReadVariableOpFAdam/m/transformer_block/layer_normalization/gamma/Read/ReadVariableOpFAdam/v/transformer_block/layer_normalization/gamma/Read/ReadVariableOpEAdam/m/transformer_block/layer_normalization/beta/Read/ReadVariableOpEAdam/v/transformer_block/layer_normalization/beta/Read/ReadVariableOpHAdam/m/transformer_block/layer_normalization_1/gamma/Read/ReadVariableOpHAdam/v/transformer_block/layer_normalization_1/gamma/Read/ReadVariableOpGAdam/m/transformer_block/layer_normalization_1/beta/Read/ReadVariableOpGAdam/v/transformer_block/layer_normalization_1/beta/Read/ReadVariableOp)Adam/m/dense_2/kernel/Read/ReadVariableOp)Adam/v/dense_2/kernel/Read/ReadVariableOp'Adam/m/dense_2/bias/Read/ReadVariableOp'Adam/v/dense_2/bias/Read/ReadVariableOp)Adam/m/dense_3/kernel/Read/ReadVariableOp)Adam/v/dense_3/kernel/Read/ReadVariableOp'Adam/m/dense_3/bias/Read/ReadVariableOp'Adam/v/dense_3/bias/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOpConst*U
TinN
L2J	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *'
f"R 
__inference__traced_save_19077
Ъ
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamedense_2/kerneldense_2/biasdense_3/kerneldense_3/bias1token_and_position_embedding/embedding/embeddings3token_and_position_embedding/embedding_1/embeddings3transformer_block/multi_head_attention/query/kernel1transformer_block/multi_head_attention/query/bias1transformer_block/multi_head_attention/key/kernel/transformer_block/multi_head_attention/key/bias3transformer_block/multi_head_attention/value/kernel1transformer_block/multi_head_attention/value/bias>transformer_block/multi_head_attention/attention_output/kernel<transformer_block/multi_head_attention/attention_output/biasdense/kernel
dense/biasdense_1/kerneldense_1/bias+transformer_block/layer_normalization/gamma*transformer_block/layer_normalization/beta-transformer_block/layer_normalization_1/gamma,transformer_block/layer_normalization_1/beta	iterationlearning_rate8Adam/m/token_and_position_embedding/embedding/embeddings8Adam/v/token_and_position_embedding/embedding/embeddings:Adam/m/token_and_position_embedding/embedding_1/embeddings:Adam/v/token_and_position_embedding/embedding_1/embeddings:Adam/m/transformer_block/multi_head_attention/query/kernel:Adam/v/transformer_block/multi_head_attention/query/kernel8Adam/m/transformer_block/multi_head_attention/query/bias8Adam/v/transformer_block/multi_head_attention/query/bias8Adam/m/transformer_block/multi_head_attention/key/kernel8Adam/v/transformer_block/multi_head_attention/key/kernel6Adam/m/transformer_block/multi_head_attention/key/bias6Adam/v/transformer_block/multi_head_attention/key/bias:Adam/m/transformer_block/multi_head_attention/value/kernel:Adam/v/transformer_block/multi_head_attention/value/kernel8Adam/m/transformer_block/multi_head_attention/value/bias8Adam/v/transformer_block/multi_head_attention/value/biasEAdam/m/transformer_block/multi_head_attention/attention_output/kernelEAdam/v/transformer_block/multi_head_attention/attention_output/kernelCAdam/m/transformer_block/multi_head_attention/attention_output/biasCAdam/v/transformer_block/multi_head_attention/attention_output/biasAdam/m/dense/kernelAdam/v/dense/kernelAdam/m/dense/biasAdam/v/dense/biasAdam/m/dense_1/kernelAdam/v/dense_1/kernelAdam/m/dense_1/biasAdam/v/dense_1/bias2Adam/m/transformer_block/layer_normalization/gamma2Adam/v/transformer_block/layer_normalization/gamma1Adam/m/transformer_block/layer_normalization/beta1Adam/v/transformer_block/layer_normalization/beta4Adam/m/transformer_block/layer_normalization_1/gamma4Adam/v/transformer_block/layer_normalization_1/gamma3Adam/m/transformer_block/layer_normalization_1/beta3Adam/v/transformer_block/layer_normalization_1/betaAdam/m/dense_2/kernelAdam/v/dense_2/kernelAdam/m/dense_2/biasAdam/v/dense_2/biasAdam/m/dense_3/kernelAdam/v/dense_3/kernelAdam/m/dense_3/biasAdam/v/dense_3/biastotal_1count_1totalcount*T
TinM
K2I*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В **
f%R#
!__inference__traced_restore_19303ађ
В
Ю
E__inference_sequential_layer_call_and_return_conditional_losses_16496

inputs
dense_16454:  
dense_16456: 
dense_1_16490:  
dense_1_16492: 
identityИҐdense/StatefulPartitionedCallҐdense_1/StatefulPartitionedCallй
dense/StatefulPartitionedCallStatefulPartitionedCallinputsdense_16454dense_16456*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_16453С
dense_1/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0dense_1_16490dense_1_16492*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_16489|
IdentityIdentity(dense_1/StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» И
NoOpNoOp^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :€€€€€€€€€» : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
Ј
N
"__inference__update_step_xla_18125
gradient
variable: *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes
: : *
	_noinline(:H D

_output_shapes

: 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
К

c
D__inference_dropout_2_layer_call_and_return_conditional_losses_18552

inputs
identityИR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *д8О?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€ C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:М
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:€€€€€€€€€ *
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ќћћ=¶
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€ T
dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    У
dropout/SelectV2SelectV2dropout/GreaterEqual:z:0dropout/Mul:z:0dropout/Const_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€ a
IdentityIdentitydropout/SelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€ "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€ :O K
'
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
К

c
D__inference_dropout_3_layer_call_and_return_conditional_losses_16945

inputs
identityИR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *д8О?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:М
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:€€€€€€€€€*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ќћћ=¶
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€T
dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    У
dropout/SelectV2SelectV2dropout/GreaterEqual:z:0dropout/Mul:z:0dropout/Const_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€a
IdentityIdentitydropout/SelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
В
Ю
E__inference_sequential_layer_call_and_return_conditional_losses_16556

inputs
dense_16545:  
dense_16547: 
dense_1_16550:  
dense_1_16552: 
identityИҐdense/StatefulPartitionedCallҐdense_1/StatefulPartitionedCallй
dense/StatefulPartitionedCallStatefulPartitionedCallinputsdense_16545dense_16547*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_16453С
dense_1/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0dense_1_16550dense_1_16552*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_16489|
IdentityIdentity(dense_1/StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» И
NoOpNoOp^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :€€€€€€€€€» : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
ї
’
%__inference_model_layer_call_fn_17409
input_1
unknown:	» 
	unknown_0:
†Ь 
	unknown_1:  
	unknown_2: 
	unknown_3:  
	unknown_4: 
	unknown_5:  
	unknown_6: 
	unknown_7:  
	unknown_8: 
	unknown_9: 

unknown_10: 

unknown_11:  

unknown_12: 

unknown_13:  

unknown_14: 

unknown_15: 

unknown_16: 

unknown_17: 

unknown_18:

unknown_19:

unknown_20:
identityИҐStatefulPartitionedCallи
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20*"
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*8
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_model_layer_call_and_return_conditional_losses_17313o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:€€€€€€€€€»: : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:€€€€€€€€€»
!
_user_specified_name	input_1
Ј
N
"__inference__update_step_xla_18050
gradient
variable: *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes
: : *
	_noinline(:H D

_output_shapes

: 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Ъµ
г
L__inference_transformer_block_layer_call_and_return_conditional_losses_18373

inputsV
@multi_head_attention_query_einsum_einsum_readvariableop_resource:  H
6multi_head_attention_query_add_readvariableop_resource: T
>multi_head_attention_key_einsum_einsum_readvariableop_resource:  F
4multi_head_attention_key_add_readvariableop_resource: V
@multi_head_attention_value_einsum_einsum_readvariableop_resource:  H
6multi_head_attention_value_add_readvariableop_resource: a
Kmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource:  O
Amulti_head_attention_attention_output_add_readvariableop_resource: G
9layer_normalization_batchnorm_mul_readvariableop_resource: C
5layer_normalization_batchnorm_readvariableop_resource: D
2sequential_dense_tensordot_readvariableop_resource:  >
0sequential_dense_biasadd_readvariableop_resource: F
4sequential_dense_1_tensordot_readvariableop_resource:  @
2sequential_dense_1_biasadd_readvariableop_resource: I
;layer_normalization_1_batchnorm_mul_readvariableop_resource: E
7layer_normalization_1_batchnorm_readvariableop_resource: 
identityИҐ,layer_normalization/batchnorm/ReadVariableOpҐ0layer_normalization/batchnorm/mul/ReadVariableOpҐ.layer_normalization_1/batchnorm/ReadVariableOpҐ2layer_normalization_1/batchnorm/mul/ReadVariableOpҐ8multi_head_attention/attention_output/add/ReadVariableOpҐBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpҐ+multi_head_attention/key/add/ReadVariableOpҐ5multi_head_attention/key/einsum/Einsum/ReadVariableOpҐ-multi_head_attention/query/add/ReadVariableOpҐ7multi_head_attention/query/einsum/Einsum/ReadVariableOpҐ-multi_head_attention/value/add/ReadVariableOpҐ7multi_head_attention/value/einsum/Einsum/ReadVariableOpҐ'sequential/dense/BiasAdd/ReadVariableOpҐ)sequential/dense/Tensordot/ReadVariableOpҐ)sequential/dense_1/BiasAdd/ReadVariableOpҐ+sequential/dense_1/Tensordot/ReadVariableOpЉ
7multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0№
(multi_head_attention/query/einsum/EinsumEinsuminputs?multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde§
-multi_head_attention/query/add/ReadVariableOpReadVariableOp6multi_head_attention_query_add_readvariableop_resource*
_output_shapes

: *
dtype0ћ
multi_head_attention/query/addAddV21multi_head_attention/query/einsum/Einsum:output:05multi_head_attention/query/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» Є
5multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOp>multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Ў
&multi_head_attention/key/einsum/EinsumEinsuminputs=multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde†
+multi_head_attention/key/add/ReadVariableOpReadVariableOp4multi_head_attention_key_add_readvariableop_resource*
_output_shapes

: *
dtype0∆
multi_head_attention/key/addAddV2/multi_head_attention/key/einsum/Einsum:output:03multi_head_attention/key/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» Љ
7multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0№
(multi_head_attention/value/einsum/EinsumEinsuminputs?multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde§
-multi_head_attention/value/add/ReadVariableOpReadVariableOp6multi_head_attention_value_add_readvariableop_resource*
_output_shapes

: *
dtype0ћ
multi_head_attention/value/addAddV21multi_head_attention/value/einsum/Einsum:output:05multi_head_attention/value/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» _
multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *у5>£
multi_head_attention/MulMul"multi_head_attention/query/add:z:0#multi_head_attention/Mul/y:output:0*
T0*0
_output_shapes
:€€€€€€€€€» –
"multi_head_attention/einsum/EinsumEinsum multi_head_attention/key/add:z:0multi_head_attention/Mul:z:0*
N*
T0*1
_output_shapes
:€€€€€€€€€»»*
equationaecd,abcd->acbeШ
$multi_head_attention/softmax/SoftmaxSoftmax+multi_head_attention/einsum/Einsum:output:0*
T0*1
_output_shapes
:€€€€€€€€€»»Э
%multi_head_attention/dropout/IdentityIdentity.multi_head_attention/softmax/Softmax:softmax:0*
T0*1
_output_shapes
:€€€€€€€€€»»е
$multi_head_attention/einsum_1/EinsumEinsum.multi_head_attention/dropout/Identity:output:0"multi_head_attention/value/add:z:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationacbe,aecd->abcd“
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpKmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Х
3multi_head_attention/attention_output/einsum/EinsumEinsum-multi_head_attention/einsum_1/Einsum:output:0Jmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*,
_output_shapes
:€€€€€€€€€» *
equationabcd,cde->abeґ
8multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpAmulti_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
: *
dtype0й
)multi_head_attention/attention_output/addAddV2<multi_head_attention/attention_output/einsum/Einsum:output:0@multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» В
dropout/IdentityIdentity-multi_head_attention/attention_output/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€» f
addAddV2inputsdropout/Identity:output:0*
T0*,
_output_shapes
:€€€€€€€€€» |
2layer_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:ґ
 layer_normalization/moments/meanMeanadd:z:0;layer_normalization/moments/mean/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(Ъ
(layer_normalization/moments/StopGradientStopGradient)layer_normalization/moments/mean:output:0*
T0*,
_output_shapes
:€€€€€€€€€»µ
-layer_normalization/moments/SquaredDifferenceSquaredDifferenceadd:z:01layer_normalization/moments/StopGradient:output:0*
T0*,
_output_shapes
:€€€€€€€€€» А
6layer_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:и
$layer_normalization/moments/varianceMean1layer_normalization/moments/SquaredDifference:z:0?layer_normalization/moments/variance/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(h
#layer_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *љ7Ж5Њ
!layer_normalization/batchnorm/addAddV2-layer_normalization/moments/variance:output:0,layer_normalization/batchnorm/add/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€»К
#layer_normalization/batchnorm/RsqrtRsqrt%layer_normalization/batchnorm/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€»¶
0layer_normalization/batchnorm/mul/ReadVariableOpReadVariableOp9layer_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0¬
!layer_normalization/batchnorm/mulMul'layer_normalization/batchnorm/Rsqrt:y:08layer_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» С
#layer_normalization/batchnorm/mul_1Muladd:z:0%layer_normalization/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ≥
#layer_normalization/batchnorm/mul_2Mul)layer_normalization/moments/mean:output:0%layer_normalization/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» Ю
,layer_normalization/batchnorm/ReadVariableOpReadVariableOp5layer_normalization_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0Њ
!layer_normalization/batchnorm/subSub4layer_normalization/batchnorm/ReadVariableOp:value:0'layer_normalization/batchnorm/mul_2:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ≥
#layer_normalization/batchnorm/add_1AddV2'layer_normalization/batchnorm/mul_1:z:0%layer_normalization/batchnorm/sub:z:0*
T0*,
_output_shapes
:€€€€€€€€€» Ь
)sequential/dense/Tensordot/ReadVariableOpReadVariableOp2sequential_dense_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0i
sequential/dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:p
sequential/dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       w
 sequential/dense/Tensordot/ShapeShape'layer_normalization/batchnorm/add_1:z:0*
T0*
_output_shapes
:j
(sequential/dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : €
#sequential/dense/Tensordot/GatherV2GatherV2)sequential/dense/Tensordot/Shape:output:0(sequential/dense/Tensordot/free:output:01sequential/dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
*sequential/dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Г
%sequential/dense/Tensordot/GatherV2_1GatherV2)sequential/dense/Tensordot/Shape:output:0(sequential/dense/Tensordot/axes:output:03sequential/dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:j
 sequential/dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: °
sequential/dense/Tensordot/ProdProd,sequential/dense/Tensordot/GatherV2:output:0)sequential/dense/Tensordot/Const:output:0*
T0*
_output_shapes
: l
"sequential/dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: І
!sequential/dense/Tensordot/Prod_1Prod.sequential/dense/Tensordot/GatherV2_1:output:0+sequential/dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: h
&sequential/dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : а
!sequential/dense/Tensordot/concatConcatV2(sequential/dense/Tensordot/free:output:0(sequential/dense/Tensordot/axes:output:0/sequential/dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:ђ
 sequential/dense/Tensordot/stackPack(sequential/dense/Tensordot/Prod:output:0*sequential/dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:љ
$sequential/dense/Tensordot/transpose	Transpose'layer_normalization/batchnorm/add_1:z:0*sequential/dense/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» љ
"sequential/dense/Tensordot/ReshapeReshape(sequential/dense/Tensordot/transpose:y:0)sequential/dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€љ
!sequential/dense/Tensordot/MatMulMatMul+sequential/dense/Tensordot/Reshape:output:01sequential/dense/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ l
"sequential/dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: j
(sequential/dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : л
#sequential/dense/Tensordot/concat_1ConcatV2,sequential/dense/Tensordot/GatherV2:output:0+sequential/dense/Tensordot/Const_2:output:01sequential/dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Ј
sequential/dense/TensordotReshape+sequential/dense/Tensordot/MatMul:product:0,sequential/dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ф
'sequential/dense/BiasAdd/ReadVariableOpReadVariableOp0sequential_dense_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0∞
sequential/dense/BiasAddBiasAdd#sequential/dense/Tensordot:output:0/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» w
sequential/dense/ReluRelu!sequential/dense/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€» †
+sequential/dense_1/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0k
!sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:r
!sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       u
"sequential/dense_1/Tensordot/ShapeShape#sequential/dense/Relu:activations:0*
T0*
_output_shapes
:l
*sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : З
%sequential/dense_1/Tensordot/GatherV2GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/free:output:03sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
,sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Л
'sequential/dense_1/Tensordot/GatherV2_1GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/axes:output:05sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
"sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: І
!sequential/dense_1/Tensordot/ProdProd.sequential/dense_1/Tensordot/GatherV2:output:0+sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≠
#sequential/dense_1/Tensordot/Prod_1Prod0sequential/dense_1/Tensordot/GatherV2_1:output:0-sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : и
#sequential/dense_1/Tensordot/concatConcatV2*sequential/dense_1/Tensordot/free:output:0*sequential/dense_1/Tensordot/axes:output:01sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:≤
"sequential/dense_1/Tensordot/stackPack*sequential/dense_1/Tensordot/Prod:output:0,sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:љ
&sequential/dense_1/Tensordot/transpose	Transpose#sequential/dense/Relu:activations:0,sequential/dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» √
$sequential/dense_1/Tensordot/ReshapeReshape*sequential/dense_1/Tensordot/transpose:y:0+sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€√
#sequential/dense_1/Tensordot/MatMulMatMul-sequential/dense_1/Tensordot/Reshape:output:03sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ n
$sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: l
*sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : у
%sequential/dense_1/Tensordot/concat_1ConcatV2.sequential/dense_1/Tensordot/GatherV2:output:0-sequential/dense_1/Tensordot/Const_2:output:03sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:љ
sequential/dense_1/TensordotReshape-sequential/dense_1/Tensordot/MatMul:product:0.sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ш
)sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0ґ
sequential/dense_1/BiasAddBiasAdd%sequential/dense_1/Tensordot:output:01sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» z
dropout_1/IdentityIdentity#sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Л
add_1AddV2'layer_normalization/batchnorm/add_1:z:0dropout_1/Identity:output:0*
T0*,
_output_shapes
:€€€€€€€€€» ~
4layer_normalization_1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:Љ
"layer_normalization_1/moments/meanMean	add_1:z:0=layer_normalization_1/moments/mean/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(Ю
*layer_normalization_1/moments/StopGradientStopGradient+layer_normalization_1/moments/mean:output:0*
T0*,
_output_shapes
:€€€€€€€€€»ї
/layer_normalization_1/moments/SquaredDifferenceSquaredDifference	add_1:z:03layer_normalization_1/moments/StopGradient:output:0*
T0*,
_output_shapes
:€€€€€€€€€» В
8layer_normalization_1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:о
&layer_normalization_1/moments/varianceMean3layer_normalization_1/moments/SquaredDifference:z:0Alayer_normalization_1/moments/variance/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(j
%layer_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *љ7Ж5ƒ
#layer_normalization_1/batchnorm/addAddV2/layer_normalization_1/moments/variance:output:0.layer_normalization_1/batchnorm/add/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€»О
%layer_normalization_1/batchnorm/RsqrtRsqrt'layer_normalization_1/batchnorm/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€»™
2layer_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOp;layer_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0»
#layer_normalization_1/batchnorm/mulMul)layer_normalization_1/batchnorm/Rsqrt:y:0:layer_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» Ч
%layer_normalization_1/batchnorm/mul_1Mul	add_1:z:0'layer_normalization_1/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» є
%layer_normalization_1/batchnorm/mul_2Mul+layer_normalization_1/moments/mean:output:0'layer_normalization_1/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» Ґ
.layer_normalization_1/batchnorm/ReadVariableOpReadVariableOp7layer_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0ƒ
#layer_normalization_1/batchnorm/subSub6layer_normalization_1/batchnorm/ReadVariableOp:value:0)layer_normalization_1/batchnorm/mul_2:z:0*
T0*,
_output_shapes
:€€€€€€€€€» є
%layer_normalization_1/batchnorm/add_1AddV2)layer_normalization_1/batchnorm/mul_1:z:0'layer_normalization_1/batchnorm/sub:z:0*
T0*,
_output_shapes
:€€€€€€€€€» }
IdentityIdentity)layer_normalization_1/batchnorm/add_1:z:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» ш
NoOpNoOp-^layer_normalization/batchnorm/ReadVariableOp1^layer_normalization/batchnorm/mul/ReadVariableOp/^layer_normalization_1/batchnorm/ReadVariableOp3^layer_normalization_1/batchnorm/mul/ReadVariableOp9^multi_head_attention/attention_output/add/ReadVariableOpC^multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp,^multi_head_attention/key/add/ReadVariableOp6^multi_head_attention/key/einsum/Einsum/ReadVariableOp.^multi_head_attention/query/add/ReadVariableOp8^multi_head_attention/query/einsum/Einsum/ReadVariableOp.^multi_head_attention/value/add/ReadVariableOp8^multi_head_attention/value/einsum/Einsum/ReadVariableOp(^sequential/dense/BiasAdd/ReadVariableOp*^sequential/dense/Tensordot/ReadVariableOp*^sequential/dense_1/BiasAdd/ReadVariableOp,^sequential/dense_1/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8:€€€€€€€€€» : : : : : : : : : : : : : : : : 2\
,layer_normalization/batchnorm/ReadVariableOp,layer_normalization/batchnorm/ReadVariableOp2d
0layer_normalization/batchnorm/mul/ReadVariableOp0layer_normalization/batchnorm/mul/ReadVariableOp2`
.layer_normalization_1/batchnorm/ReadVariableOp.layer_normalization_1/batchnorm/ReadVariableOp2h
2layer_normalization_1/batchnorm/mul/ReadVariableOp2layer_normalization_1/batchnorm/mul/ReadVariableOp2t
8multi_head_attention/attention_output/add/ReadVariableOp8multi_head_attention/attention_output/add/ReadVariableOp2И
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp2Z
+multi_head_attention/key/add/ReadVariableOp+multi_head_attention/key/add/ReadVariableOp2n
5multi_head_attention/key/einsum/Einsum/ReadVariableOp5multi_head_attention/key/einsum/Einsum/ReadVariableOp2^
-multi_head_attention/query/add/ReadVariableOp-multi_head_attention/query/add/ReadVariableOp2r
7multi_head_attention/query/einsum/Einsum/ReadVariableOp7multi_head_attention/query/einsum/Einsum/ReadVariableOp2^
-multi_head_attention/value/add/ReadVariableOp-multi_head_attention/value/add/ReadVariableOp2r
7multi_head_attention/value/einsum/Einsum/ReadVariableOp7multi_head_attention/value/einsum/Einsum/ReadVariableOp2R
'sequential/dense/BiasAdd/ReadVariableOp'sequential/dense/BiasAdd/ReadVariableOp2V
)sequential/dense/Tensordot/ReadVariableOp)sequential/dense/Tensordot/ReadVariableOp2V
)sequential/dense_1/BiasAdd/ReadVariableOp)sequential/dense_1/BiasAdd/ReadVariableOp2Z
+sequential/dense_1/Tensordot/ReadVariableOp+sequential/dense_1/Tensordot/ReadVariableOp:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
µ,
ё	
@__inference_model_layer_call_and_return_conditional_losses_17519
input_15
"token_and_position_embedding_17467:	» 6
"token_and_position_embedding_17469:
†Ь -
transformer_block_17472:  )
transformer_block_17474: -
transformer_block_17476:  )
transformer_block_17478: -
transformer_block_17480:  )
transformer_block_17482: -
transformer_block_17484:  %
transformer_block_17486: %
transformer_block_17488: %
transformer_block_17490: )
transformer_block_17492:  %
transformer_block_17494: )
transformer_block_17496:  %
transformer_block_17498: %
transformer_block_17500: %
transformer_block_17502: 
dense_2_17507: 
dense_2_17509:
dense_3_17513:
dense_3_17515:
identityИҐdense_2/StatefulPartitionedCallҐdense_3/StatefulPartitionedCallҐ!dropout_2/StatefulPartitionedCallҐ!dropout_3/StatefulPartitionedCallҐ4token_and_position_embedding/StatefulPartitionedCallҐ)transformer_block/StatefulPartitionedCall∆
4token_and_position_embedding/StatefulPartitionedCallStatefulPartitionedCallinput_1"token_and_position_embedding_17467"token_and_position_embedding_17469*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *`
f[RY
W__inference_token_and_position_embedding_layer_call_and_return_conditional_losses_16651 
)transformer_block/StatefulPartitionedCallStatefulPartitionedCall=token_and_position_embedding/StatefulPartitionedCall:output:0transformer_block_17472transformer_block_17474transformer_block_17476transformer_block_17478transformer_block_17480transformer_block_17482transformer_block_17484transformer_block_17486transformer_block_17488transformer_block_17490transformer_block_17492transformer_block_17494transformer_block_17496transformer_block_17498transformer_block_17500transformer_block_17502*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *2
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *U
fPRN
L__inference_transformer_block_layer_call_and_return_conditional_losses_17162Ж
(global_average_pooling1d/PartitionedCallPartitionedCall2transformer_block/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *\
fWRU
S__inference_global_average_pooling1d_layer_call_and_return_conditional_losses_16618ч
!dropout_2/StatefulPartitionedCallStatefulPartitionedCall1global_average_pooling1d/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_16978Р
dense_2/StatefulPartitionedCallStatefulPartitionedCall*dropout_2/StatefulPartitionedCall:output:0dense_2_17507dense_2_17509*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_16837Т
!dropout_3/StatefulPartitionedCallStatefulPartitionedCall(dense_2/StatefulPartitionedCall:output:0"^dropout_2/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_16945Р
dense_3/StatefulPartitionedCallStatefulPartitionedCall*dropout_3/StatefulPartitionedCall:output:0dense_3_17513dense_3_17515*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_16861w
IdentityIdentity(dense_3/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€µ
NoOpNoOp ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall"^dropout_2/StatefulPartitionedCall"^dropout_3/StatefulPartitionedCall5^token_and_position_embedding/StatefulPartitionedCall*^transformer_block/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:€€€€€€€€€»: : : : : : : : : : : : : : : : : : : : : : 2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2F
!dropout_2/StatefulPartitionedCall!dropout_2/StatefulPartitionedCall2F
!dropout_3/StatefulPartitionedCall!dropout_3/StatefulPartitionedCall2l
4token_and_position_embedding/StatefulPartitionedCall4token_and_position_embedding/StatefulPartitionedCall2V
)transformer_block/StatefulPartitionedCall)transformer_block/StatefulPartitionedCall:Q M
(
_output_shapes
:€€€€€€€€€»
!
_user_specified_name	input_1
ђ™
Б
 __inference__wrapped_model_16415
input_1X
Emodel_token_and_position_embedding_embedding_1_embedding_lookup_16262:	» W
Cmodel_token_and_position_embedding_embedding_embedding_lookup_16267:
†Ь n
Xmodel_transformer_block_multi_head_attention_query_einsum_einsum_readvariableop_resource:  `
Nmodel_transformer_block_multi_head_attention_query_add_readvariableop_resource: l
Vmodel_transformer_block_multi_head_attention_key_einsum_einsum_readvariableop_resource:  ^
Lmodel_transformer_block_multi_head_attention_key_add_readvariableop_resource: n
Xmodel_transformer_block_multi_head_attention_value_einsum_einsum_readvariableop_resource:  `
Nmodel_transformer_block_multi_head_attention_value_add_readvariableop_resource: y
cmodel_transformer_block_multi_head_attention_attention_output_einsum_einsum_readvariableop_resource:  g
Ymodel_transformer_block_multi_head_attention_attention_output_add_readvariableop_resource: _
Qmodel_transformer_block_layer_normalization_batchnorm_mul_readvariableop_resource: [
Mmodel_transformer_block_layer_normalization_batchnorm_readvariableop_resource: \
Jmodel_transformer_block_sequential_dense_tensordot_readvariableop_resource:  V
Hmodel_transformer_block_sequential_dense_biasadd_readvariableop_resource: ^
Lmodel_transformer_block_sequential_dense_1_tensordot_readvariableop_resource:  X
Jmodel_transformer_block_sequential_dense_1_biasadd_readvariableop_resource: a
Smodel_transformer_block_layer_normalization_1_batchnorm_mul_readvariableop_resource: ]
Omodel_transformer_block_layer_normalization_1_batchnorm_readvariableop_resource: >
,model_dense_2_matmul_readvariableop_resource: ;
-model_dense_2_biasadd_readvariableop_resource:>
,model_dense_3_matmul_readvariableop_resource:;
-model_dense_3_biasadd_readvariableop_resource:
identityИҐ$model/dense_2/BiasAdd/ReadVariableOpҐ#model/dense_2/MatMul/ReadVariableOpҐ$model/dense_3/BiasAdd/ReadVariableOpҐ#model/dense_3/MatMul/ReadVariableOpҐ=model/token_and_position_embedding/embedding/embedding_lookupҐ?model/token_and_position_embedding/embedding_1/embedding_lookupҐDmodel/transformer_block/layer_normalization/batchnorm/ReadVariableOpҐHmodel/transformer_block/layer_normalization/batchnorm/mul/ReadVariableOpҐFmodel/transformer_block/layer_normalization_1/batchnorm/ReadVariableOpҐJmodel/transformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOpҐPmodel/transformer_block/multi_head_attention/attention_output/add/ReadVariableOpҐZmodel/transformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpҐCmodel/transformer_block/multi_head_attention/key/add/ReadVariableOpҐMmodel/transformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOpҐEmodel/transformer_block/multi_head_attention/query/add/ReadVariableOpҐOmodel/transformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOpҐEmodel/transformer_block/multi_head_attention/value/add/ReadVariableOpҐOmodel/transformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOpҐ?model/transformer_block/sequential/dense/BiasAdd/ReadVariableOpҐAmodel/transformer_block/sequential/dense/Tensordot/ReadVariableOpҐAmodel/transformer_block/sequential/dense_1/BiasAdd/ReadVariableOpҐCmodel/transformer_block/sequential/dense_1/Tensordot/ReadVariableOp_
(model/token_and_position_embedding/ShapeShapeinput_1*
T0*
_output_shapes
:Й
6model/token_and_position_embedding/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
€€€€€€€€€В
8model/token_and_position_embedding/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: В
8model/token_and_position_embedding/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:А
0model/token_and_position_embedding/strided_sliceStridedSlice1model/token_and_position_embedding/Shape:output:0?model/token_and_position_embedding/strided_slice/stack:output:0Amodel/token_and_position_embedding/strided_slice/stack_1:output:0Amodel/token_and_position_embedding/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskp
.model/token_and_position_embedding/range/startConst*
_output_shapes
: *
dtype0*
value	B : p
.model/token_and_position_embedding/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :ы
(model/token_and_position_embedding/rangeRange7model/token_and_position_embedding/range/start:output:09model/token_and_position_embedding/strided_slice:output:07model/token_and_position_embedding/range/delta:output:0*
_output_shapes	
:»г
?model/token_and_position_embedding/embedding_1/embedding_lookupResourceGatherEmodel_token_and_position_embedding_embedding_1_embedding_lookup_162621model/token_and_position_embedding/range:output:0*
Tindices0*X
_classN
LJloc:@model/token_and_position_embedding/embedding_1/embedding_lookup/16262*
_output_shapes
:	» *
dtype0Ґ
Hmodel/token_and_position_embedding/embedding_1/embedding_lookup/IdentityIdentityHmodel/token_and_position_embedding/embedding_1/embedding_lookup:output:0*
T0*X
_classN
LJloc:@model/token_and_position_embedding/embedding_1/embedding_lookup/16262*
_output_shapes
:	» ”
Jmodel/token_and_position_embedding/embedding_1/embedding_lookup/Identity_1IdentityQmodel/token_and_position_embedding/embedding_1/embedding_lookup/Identity:output:0*
T0*
_output_shapes
:	» ј
=model/token_and_position_embedding/embedding/embedding_lookupResourceGatherCmodel_token_and_position_embedding_embedding_embedding_lookup_16267input_1*
Tindices0*V
_classL
JHloc:@model/token_and_position_embedding/embedding/embedding_lookup/16267*,
_output_shapes
:€€€€€€€€€» *
dtype0©
Fmodel/token_and_position_embedding/embedding/embedding_lookup/IdentityIdentityFmodel/token_and_position_embedding/embedding/embedding_lookup:output:0*
T0*V
_classL
JHloc:@model/token_and_position_embedding/embedding/embedding_lookup/16267*,
_output_shapes
:€€€€€€€€€» №
Hmodel/token_and_position_embedding/embedding/embedding_lookup/Identity_1IdentityOmodel/token_and_position_embedding/embedding/embedding_lookup/Identity:output:0*
T0*,
_output_shapes
:€€€€€€€€€» О
&model/token_and_position_embedding/addAddV2Qmodel/token_and_position_embedding/embedding/embedding_lookup/Identity_1:output:0Smodel/token_and_position_embedding/embedding_1/embedding_lookup/Identity_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» м
Omodel/transformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOpXmodel_transformer_block_multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0∞
@model/transformer_block/multi_head_attention/query/einsum/EinsumEinsum*model/token_and_position_embedding/add:z:0Wmodel/transformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde‘
Emodel/transformer_block/multi_head_attention/query/add/ReadVariableOpReadVariableOpNmodel_transformer_block_multi_head_attention_query_add_readvariableop_resource*
_output_shapes

: *
dtype0Ф
6model/transformer_block/multi_head_attention/query/addAddV2Imodel/transformer_block/multi_head_attention/query/einsum/Einsum:output:0Mmodel/transformer_block/multi_head_attention/query/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» и
Mmodel/transformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOpVmodel_transformer_block_multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0ђ
>model/transformer_block/multi_head_attention/key/einsum/EinsumEinsum*model/token_and_position_embedding/add:z:0Umodel/transformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde–
Cmodel/transformer_block/multi_head_attention/key/add/ReadVariableOpReadVariableOpLmodel_transformer_block_multi_head_attention_key_add_readvariableop_resource*
_output_shapes

: *
dtype0О
4model/transformer_block/multi_head_attention/key/addAddV2Gmodel/transformer_block/multi_head_attention/key/einsum/Einsum:output:0Kmodel/transformer_block/multi_head_attention/key/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» м
Omodel/transformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOpXmodel_transformer_block_multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0∞
@model/transformer_block/multi_head_attention/value/einsum/EinsumEinsum*model/token_and_position_embedding/add:z:0Wmodel/transformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde‘
Emodel/transformer_block/multi_head_attention/value/add/ReadVariableOpReadVariableOpNmodel_transformer_block_multi_head_attention_value_add_readvariableop_resource*
_output_shapes

: *
dtype0Ф
6model/transformer_block/multi_head_attention/value/addAddV2Imodel/transformer_block/multi_head_attention/value/einsum/Einsum:output:0Mmodel/transformer_block/multi_head_attention/value/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» w
2model/transformer_block/multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *у5>л
0model/transformer_block/multi_head_attention/MulMul:model/transformer_block/multi_head_attention/query/add:z:0;model/transformer_block/multi_head_attention/Mul/y:output:0*
T0*0
_output_shapes
:€€€€€€€€€» Ш
:model/transformer_block/multi_head_attention/einsum/EinsumEinsum8model/transformer_block/multi_head_attention/key/add:z:04model/transformer_block/multi_head_attention/Mul:z:0*
N*
T0*1
_output_shapes
:€€€€€€€€€»»*
equationaecd,abcd->acbe»
<model/transformer_block/multi_head_attention/softmax/SoftmaxSoftmaxCmodel/transformer_block/multi_head_attention/einsum/Einsum:output:0*
T0*1
_output_shapes
:€€€€€€€€€»»Ќ
=model/transformer_block/multi_head_attention/dropout/IdentityIdentityFmodel/transformer_block/multi_head_attention/softmax/Softmax:softmax:0*
T0*1
_output_shapes
:€€€€€€€€€»»≠
<model/transformer_block/multi_head_attention/einsum_1/EinsumEinsumFmodel/transformer_block/multi_head_attention/dropout/Identity:output:0:model/transformer_block/multi_head_attention/value/add:z:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationacbe,aecd->abcdВ
Zmodel/transformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpcmodel_transformer_block_multi_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Ё
Kmodel/transformer_block/multi_head_attention/attention_output/einsum/EinsumEinsumEmodel/transformer_block/multi_head_attention/einsum_1/Einsum:output:0bmodel/transformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*,
_output_shapes
:€€€€€€€€€» *
equationabcd,cde->abeж
Pmodel/transformer_block/multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpYmodel_transformer_block_multi_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
: *
dtype0±
Amodel/transformer_block/multi_head_attention/attention_output/addAddV2Tmodel/transformer_block/multi_head_attention/attention_output/einsum/Einsum:output:0Xmodel/transformer_block/multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» ≤
(model/transformer_block/dropout/IdentityIdentityEmodel/transformer_block/multi_head_attention/attention_output/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€» Ї
model/transformer_block/addAddV2*model/token_and_position_embedding/add:z:01model/transformer_block/dropout/Identity:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ф
Jmodel/transformer_block/layer_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:ю
8model/transformer_block/layer_normalization/moments/meanMeanmodel/transformer_block/add:z:0Smodel/transformer_block/layer_normalization/moments/mean/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims( 
@model/transformer_block/layer_normalization/moments/StopGradientStopGradientAmodel/transformer_block/layer_normalization/moments/mean:output:0*
T0*,
_output_shapes
:€€€€€€€€€»э
Emodel/transformer_block/layer_normalization/moments/SquaredDifferenceSquaredDifferencemodel/transformer_block/add:z:0Imodel/transformer_block/layer_normalization/moments/StopGradient:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ш
Nmodel/transformer_block/layer_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:∞
<model/transformer_block/layer_normalization/moments/varianceMeanImodel/transformer_block/layer_normalization/moments/SquaredDifference:z:0Wmodel/transformer_block/layer_normalization/moments/variance/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(А
;model/transformer_block/layer_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *љ7Ж5Ж
9model/transformer_block/layer_normalization/batchnorm/addAddV2Emodel/transformer_block/layer_normalization/moments/variance:output:0Dmodel/transformer_block/layer_normalization/batchnorm/add/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€»Ї
;model/transformer_block/layer_normalization/batchnorm/RsqrtRsqrt=model/transformer_block/layer_normalization/batchnorm/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€»÷
Hmodel/transformer_block/layer_normalization/batchnorm/mul/ReadVariableOpReadVariableOpQmodel_transformer_block_layer_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0К
9model/transformer_block/layer_normalization/batchnorm/mulMul?model/transformer_block/layer_normalization/batchnorm/Rsqrt:y:0Pmodel/transformer_block/layer_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» ў
;model/transformer_block/layer_normalization/batchnorm/mul_1Mulmodel/transformer_block/add:z:0=model/transformer_block/layer_normalization/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ы
;model/transformer_block/layer_normalization/batchnorm/mul_2MulAmodel/transformer_block/layer_normalization/moments/mean:output:0=model/transformer_block/layer_normalization/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ќ
Dmodel/transformer_block/layer_normalization/batchnorm/ReadVariableOpReadVariableOpMmodel_transformer_block_layer_normalization_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0Ж
9model/transformer_block/layer_normalization/batchnorm/subSubLmodel/transformer_block/layer_normalization/batchnorm/ReadVariableOp:value:0?model/transformer_block/layer_normalization/batchnorm/mul_2:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ы
;model/transformer_block/layer_normalization/batchnorm/add_1AddV2?model/transformer_block/layer_normalization/batchnorm/mul_1:z:0=model/transformer_block/layer_normalization/batchnorm/sub:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ћ
Amodel/transformer_block/sequential/dense/Tensordot/ReadVariableOpReadVariableOpJmodel_transformer_block_sequential_dense_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0Б
7model/transformer_block/sequential/dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:И
7model/transformer_block/sequential/dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       І
8model/transformer_block/sequential/dense/Tensordot/ShapeShape?model/transformer_block/layer_normalization/batchnorm/add_1:z:0*
T0*
_output_shapes
:В
@model/transformer_block/sequential/dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : я
;model/transformer_block/sequential/dense/Tensordot/GatherV2GatherV2Amodel/transformer_block/sequential/dense/Tensordot/Shape:output:0@model/transformer_block/sequential/dense/Tensordot/free:output:0Imodel/transformer_block/sequential/dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Д
Bmodel/transformer_block/sequential/dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : г
=model/transformer_block/sequential/dense/Tensordot/GatherV2_1GatherV2Amodel/transformer_block/sequential/dense/Tensordot/Shape:output:0@model/transformer_block/sequential/dense/Tensordot/axes:output:0Kmodel/transformer_block/sequential/dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:В
8model/transformer_block/sequential/dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: й
7model/transformer_block/sequential/dense/Tensordot/ProdProdDmodel/transformer_block/sequential/dense/Tensordot/GatherV2:output:0Amodel/transformer_block/sequential/dense/Tensordot/Const:output:0*
T0*
_output_shapes
: Д
:model/transformer_block/sequential/dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: п
9model/transformer_block/sequential/dense/Tensordot/Prod_1ProdFmodel/transformer_block/sequential/dense/Tensordot/GatherV2_1:output:0Cmodel/transformer_block/sequential/dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: А
>model/transformer_block/sequential/dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ј
9model/transformer_block/sequential/dense/Tensordot/concatConcatV2@model/transformer_block/sequential/dense/Tensordot/free:output:0@model/transformer_block/sequential/dense/Tensordot/axes:output:0Gmodel/transformer_block/sequential/dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:ф
8model/transformer_block/sequential/dense/Tensordot/stackPack@model/transformer_block/sequential/dense/Tensordot/Prod:output:0Bmodel/transformer_block/sequential/dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Е
<model/transformer_block/sequential/dense/Tensordot/transpose	Transpose?model/transformer_block/layer_normalization/batchnorm/add_1:z:0Bmodel/transformer_block/sequential/dense/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Е
:model/transformer_block/sequential/dense/Tensordot/ReshapeReshape@model/transformer_block/sequential/dense/Tensordot/transpose:y:0Amodel/transformer_block/sequential/dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Е
9model/transformer_block/sequential/dense/Tensordot/MatMulMatMulCmodel/transformer_block/sequential/dense/Tensordot/Reshape:output:0Imodel/transformer_block/sequential/dense/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ Д
:model/transformer_block/sequential/dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: В
@model/transformer_block/sequential/dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ћ
;model/transformer_block/sequential/dense/Tensordot/concat_1ConcatV2Dmodel/transformer_block/sequential/dense/Tensordot/GatherV2:output:0Cmodel/transformer_block/sequential/dense/Tensordot/Const_2:output:0Imodel/transformer_block/sequential/dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:€
2model/transformer_block/sequential/dense/TensordotReshapeCmodel/transformer_block/sequential/dense/Tensordot/MatMul:product:0Dmodel/transformer_block/sequential/dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» ƒ
?model/transformer_block/sequential/dense/BiasAdd/ReadVariableOpReadVariableOpHmodel_transformer_block_sequential_dense_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0ш
0model/transformer_block/sequential/dense/BiasAddBiasAdd;model/transformer_block/sequential/dense/Tensordot:output:0Gmodel/transformer_block/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» І
-model/transformer_block/sequential/dense/ReluRelu9model/transformer_block/sequential/dense/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€» –
Cmodel/transformer_block/sequential/dense_1/Tensordot/ReadVariableOpReadVariableOpLmodel_transformer_block_sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0Г
9model/transformer_block/sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:К
9model/transformer_block/sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       •
:model/transformer_block/sequential/dense_1/Tensordot/ShapeShape;model/transformer_block/sequential/dense/Relu:activations:0*
T0*
_output_shapes
:Д
Bmodel/transformer_block/sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : з
=model/transformer_block/sequential/dense_1/Tensordot/GatherV2GatherV2Cmodel/transformer_block/sequential/dense_1/Tensordot/Shape:output:0Bmodel/transformer_block/sequential/dense_1/Tensordot/free:output:0Kmodel/transformer_block/sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Ж
Dmodel/transformer_block/sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : л
?model/transformer_block/sequential/dense_1/Tensordot/GatherV2_1GatherV2Cmodel/transformer_block/sequential/dense_1/Tensordot/Shape:output:0Bmodel/transformer_block/sequential/dense_1/Tensordot/axes:output:0Mmodel/transformer_block/sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Д
:model/transformer_block/sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: п
9model/transformer_block/sequential/dense_1/Tensordot/ProdProdFmodel/transformer_block/sequential/dense_1/Tensordot/GatherV2:output:0Cmodel/transformer_block/sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: Ж
<model/transformer_block/sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: х
;model/transformer_block/sequential/dense_1/Tensordot/Prod_1ProdHmodel/transformer_block/sequential/dense_1/Tensordot/GatherV2_1:output:0Emodel/transformer_block/sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: В
@model/transformer_block/sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : »
;model/transformer_block/sequential/dense_1/Tensordot/concatConcatV2Bmodel/transformer_block/sequential/dense_1/Tensordot/free:output:0Bmodel/transformer_block/sequential/dense_1/Tensordot/axes:output:0Imodel/transformer_block/sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:ъ
:model/transformer_block/sequential/dense_1/Tensordot/stackPackBmodel/transformer_block/sequential/dense_1/Tensordot/Prod:output:0Dmodel/transformer_block/sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Е
>model/transformer_block/sequential/dense_1/Tensordot/transpose	Transpose;model/transformer_block/sequential/dense/Relu:activations:0Dmodel/transformer_block/sequential/dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Л
<model/transformer_block/sequential/dense_1/Tensordot/ReshapeReshapeBmodel/transformer_block/sequential/dense_1/Tensordot/transpose:y:0Cmodel/transformer_block/sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Л
;model/transformer_block/sequential/dense_1/Tensordot/MatMulMatMulEmodel/transformer_block/sequential/dense_1/Tensordot/Reshape:output:0Kmodel/transformer_block/sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ Ж
<model/transformer_block/sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: Д
Bmodel/transformer_block/sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ”
=model/transformer_block/sequential/dense_1/Tensordot/concat_1ConcatV2Fmodel/transformer_block/sequential/dense_1/Tensordot/GatherV2:output:0Emodel/transformer_block/sequential/dense_1/Tensordot/Const_2:output:0Kmodel/transformer_block/sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Е
4model/transformer_block/sequential/dense_1/TensordotReshapeEmodel/transformer_block/sequential/dense_1/Tensordot/MatMul:product:0Fmodel/transformer_block/sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» »
Amodel/transformer_block/sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOpJmodel_transformer_block_sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0ю
2model/transformer_block/sequential/dense_1/BiasAddBiasAdd=model/transformer_block/sequential/dense_1/Tensordot:output:0Imodel/transformer_block/sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» ™
*model/transformer_block/dropout_1/IdentityIdentity;model/transformer_block/sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€» ”
model/transformer_block/add_1AddV2?model/transformer_block/layer_normalization/batchnorm/add_1:z:03model/transformer_block/dropout_1/Identity:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ц
Lmodel/transformer_block/layer_normalization_1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:Д
:model/transformer_block/layer_normalization_1/moments/meanMean!model/transformer_block/add_1:z:0Umodel/transformer_block/layer_normalization_1/moments/mean/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(ќ
Bmodel/transformer_block/layer_normalization_1/moments/StopGradientStopGradientCmodel/transformer_block/layer_normalization_1/moments/mean:output:0*
T0*,
_output_shapes
:€€€€€€€€€»Г
Gmodel/transformer_block/layer_normalization_1/moments/SquaredDifferenceSquaredDifference!model/transformer_block/add_1:z:0Kmodel/transformer_block/layer_normalization_1/moments/StopGradient:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ъ
Pmodel/transformer_block/layer_normalization_1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:ґ
>model/transformer_block/layer_normalization_1/moments/varianceMeanKmodel/transformer_block/layer_normalization_1/moments/SquaredDifference:z:0Ymodel/transformer_block/layer_normalization_1/moments/variance/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(В
=model/transformer_block/layer_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *љ7Ж5М
;model/transformer_block/layer_normalization_1/batchnorm/addAddV2Gmodel/transformer_block/layer_normalization_1/moments/variance:output:0Fmodel/transformer_block/layer_normalization_1/batchnorm/add/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€»Њ
=model/transformer_block/layer_normalization_1/batchnorm/RsqrtRsqrt?model/transformer_block/layer_normalization_1/batchnorm/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€»Џ
Jmodel/transformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOpSmodel_transformer_block_layer_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0Р
;model/transformer_block/layer_normalization_1/batchnorm/mulMulAmodel/transformer_block/layer_normalization_1/batchnorm/Rsqrt:y:0Rmodel/transformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» я
=model/transformer_block/layer_normalization_1/batchnorm/mul_1Mul!model/transformer_block/add_1:z:0?model/transformer_block/layer_normalization_1/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» Б
=model/transformer_block/layer_normalization_1/batchnorm/mul_2MulCmodel/transformer_block/layer_normalization_1/moments/mean:output:0?model/transformer_block/layer_normalization_1/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» “
Fmodel/transformer_block/layer_normalization_1/batchnorm/ReadVariableOpReadVariableOpOmodel_transformer_block_layer_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0М
;model/transformer_block/layer_normalization_1/batchnorm/subSubNmodel/transformer_block/layer_normalization_1/batchnorm/ReadVariableOp:value:0Amodel/transformer_block/layer_normalization_1/batchnorm/mul_2:z:0*
T0*,
_output_shapes
:€€€€€€€€€» Б
=model/transformer_block/layer_normalization_1/batchnorm/add_1AddV2Amodel/transformer_block/layer_normalization_1/batchnorm/mul_1:z:0?model/transformer_block/layer_normalization_1/batchnorm/sub:z:0*
T0*,
_output_shapes
:€€€€€€€€€» w
5model/global_average_pooling1d/Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :а
#model/global_average_pooling1d/MeanMeanAmodel/transformer_block/layer_normalization_1/batchnorm/add_1:z:0>model/global_average_pooling1d/Mean/reduction_indices:output:0*
T0*'
_output_shapes
:€€€€€€€€€ Д
model/dropout_2/IdentityIdentity,model/global_average_pooling1d/Mean:output:0*
T0*'
_output_shapes
:€€€€€€€€€ Р
#model/dense_2/MatMul/ReadVariableOpReadVariableOp,model_dense_2_matmul_readvariableop_resource*
_output_shapes

: *
dtype0†
model/dense_2/MatMulMatMul!model/dropout_2/Identity:output:0+model/dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€О
$model/dense_2/BiasAdd/ReadVariableOpReadVariableOp-model_dense_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0†
model/dense_2/BiasAddBiasAddmodel/dense_2/MatMul:product:0,model/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€l
model/dense_2/ReluRelumodel/dense_2/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€x
model/dropout_3/IdentityIdentity model/dense_2/Relu:activations:0*
T0*'
_output_shapes
:€€€€€€€€€Р
#model/dense_3/MatMul/ReadVariableOpReadVariableOp,model_dense_3_matmul_readvariableop_resource*
_output_shapes

:*
dtype0†
model/dense_3/MatMulMatMul!model/dropout_3/Identity:output:0+model/dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€О
$model/dense_3/BiasAdd/ReadVariableOpReadVariableOp-model_dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0†
model/dense_3/BiasAddBiasAddmodel/dense_3/MatMul:product:0,model/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€r
model/dense_3/SoftmaxSoftmaxmodel/dense_3/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€n
IdentityIdentitymodel/dense_3/Softmax:softmax:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€Ф
NoOpNoOp%^model/dense_2/BiasAdd/ReadVariableOp$^model/dense_2/MatMul/ReadVariableOp%^model/dense_3/BiasAdd/ReadVariableOp$^model/dense_3/MatMul/ReadVariableOp>^model/token_and_position_embedding/embedding/embedding_lookup@^model/token_and_position_embedding/embedding_1/embedding_lookupE^model/transformer_block/layer_normalization/batchnorm/ReadVariableOpI^model/transformer_block/layer_normalization/batchnorm/mul/ReadVariableOpG^model/transformer_block/layer_normalization_1/batchnorm/ReadVariableOpK^model/transformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOpQ^model/transformer_block/multi_head_attention/attention_output/add/ReadVariableOp[^model/transformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpD^model/transformer_block/multi_head_attention/key/add/ReadVariableOpN^model/transformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOpF^model/transformer_block/multi_head_attention/query/add/ReadVariableOpP^model/transformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOpF^model/transformer_block/multi_head_attention/value/add/ReadVariableOpP^model/transformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOp@^model/transformer_block/sequential/dense/BiasAdd/ReadVariableOpB^model/transformer_block/sequential/dense/Tensordot/ReadVariableOpB^model/transformer_block/sequential/dense_1/BiasAdd/ReadVariableOpD^model/transformer_block/sequential/dense_1/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:€€€€€€€€€»: : : : : : : : : : : : : : : : : : : : : : 2L
$model/dense_2/BiasAdd/ReadVariableOp$model/dense_2/BiasAdd/ReadVariableOp2J
#model/dense_2/MatMul/ReadVariableOp#model/dense_2/MatMul/ReadVariableOp2L
$model/dense_3/BiasAdd/ReadVariableOp$model/dense_3/BiasAdd/ReadVariableOp2J
#model/dense_3/MatMul/ReadVariableOp#model/dense_3/MatMul/ReadVariableOp2~
=model/token_and_position_embedding/embedding/embedding_lookup=model/token_and_position_embedding/embedding/embedding_lookup2В
?model/token_and_position_embedding/embedding_1/embedding_lookup?model/token_and_position_embedding/embedding_1/embedding_lookup2М
Dmodel/transformer_block/layer_normalization/batchnorm/ReadVariableOpDmodel/transformer_block/layer_normalization/batchnorm/ReadVariableOp2Ф
Hmodel/transformer_block/layer_normalization/batchnorm/mul/ReadVariableOpHmodel/transformer_block/layer_normalization/batchnorm/mul/ReadVariableOp2Р
Fmodel/transformer_block/layer_normalization_1/batchnorm/ReadVariableOpFmodel/transformer_block/layer_normalization_1/batchnorm/ReadVariableOp2Ш
Jmodel/transformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOpJmodel/transformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOp2§
Pmodel/transformer_block/multi_head_attention/attention_output/add/ReadVariableOpPmodel/transformer_block/multi_head_attention/attention_output/add/ReadVariableOp2Є
Zmodel/transformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpZmodel/transformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp2К
Cmodel/transformer_block/multi_head_attention/key/add/ReadVariableOpCmodel/transformer_block/multi_head_attention/key/add/ReadVariableOp2Ю
Mmodel/transformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOpMmodel/transformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOp2О
Emodel/transformer_block/multi_head_attention/query/add/ReadVariableOpEmodel/transformer_block/multi_head_attention/query/add/ReadVariableOp2Ґ
Omodel/transformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOpOmodel/transformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOp2О
Emodel/transformer_block/multi_head_attention/value/add/ReadVariableOpEmodel/transformer_block/multi_head_attention/value/add/ReadVariableOp2Ґ
Omodel/transformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOpOmodel/transformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOp2В
?model/transformer_block/sequential/dense/BiasAdd/ReadVariableOp?model/transformer_block/sequential/dense/BiasAdd/ReadVariableOp2Ж
Amodel/transformer_block/sequential/dense/Tensordot/ReadVariableOpAmodel/transformer_block/sequential/dense/Tensordot/ReadVariableOp2Ж
Amodel/transformer_block/sequential/dense_1/BiasAdd/ReadVariableOpAmodel/transformer_block/sequential/dense_1/BiasAdd/ReadVariableOp2К
Cmodel/transformer_block/sequential/dense_1/Tensordot/ReadVariableOpCmodel/transformer_block/sequential/dense_1/Tensordot/ReadVariableOp:Q M
(
_output_shapes
:€€€€€€€€€»
!
_user_specified_name	input_1
Њ)
Х	
@__inference_model_layer_call_and_return_conditional_losses_16868

inputs5
"token_and_position_embedding_16652:	» 6
"token_and_position_embedding_16654:
†Ь -
transformer_block_16785:  )
transformer_block_16787: -
transformer_block_16789:  )
transformer_block_16791: -
transformer_block_16793:  )
transformer_block_16795: -
transformer_block_16797:  %
transformer_block_16799: %
transformer_block_16801: %
transformer_block_16803: )
transformer_block_16805:  %
transformer_block_16807: )
transformer_block_16809:  %
transformer_block_16811: %
transformer_block_16813: %
transformer_block_16815: 
dense_2_16838: 
dense_2_16840:
dense_3_16862:
dense_3_16864:
identityИҐdense_2/StatefulPartitionedCallҐdense_3/StatefulPartitionedCallҐ4token_and_position_embedding/StatefulPartitionedCallҐ)transformer_block/StatefulPartitionedCall≈
4token_and_position_embedding/StatefulPartitionedCallStatefulPartitionedCallinputs"token_and_position_embedding_16652"token_and_position_embedding_16654*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *`
f[RY
W__inference_token_and_position_embedding_layer_call_and_return_conditional_losses_16651 
)transformer_block/StatefulPartitionedCallStatefulPartitionedCall=token_and_position_embedding/StatefulPartitionedCall:output:0transformer_block_16785transformer_block_16787transformer_block_16789transformer_block_16791transformer_block_16793transformer_block_16795transformer_block_16797transformer_block_16799transformer_block_16801transformer_block_16803transformer_block_16805transformer_block_16807transformer_block_16809transformer_block_16811transformer_block_16813transformer_block_16815*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *2
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *U
fPRN
L__inference_transformer_block_layer_call_and_return_conditional_losses_16784Ж
(global_average_pooling1d/PartitionedCallPartitionedCall2transformer_block/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *\
fWRU
S__inference_global_average_pooling1d_layer_call_and_return_conditional_losses_16618з
dropout_2/PartitionedCallPartitionedCall1global_average_pooling1d/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_16824И
dense_2/StatefulPartitionedCallStatefulPartitionedCall"dropout_2/PartitionedCall:output:0dense_2_16838dense_2_16840*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_16837ё
dropout_3/PartitionedCallPartitionedCall(dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_16848И
dense_3/StatefulPartitionedCallStatefulPartitionedCall"dropout_3/PartitionedCall:output:0dense_3_16862dense_3_16864*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_16861w
IdentityIdentity(dense_3/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€н
NoOpNoOp ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall5^token_and_position_embedding/StatefulPartitionedCall*^transformer_block/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:€€€€€€€€€»: : : : : : : : : : : : : : : : : : : : : : 2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2l
4token_and_position_embedding/StatefulPartitionedCall4token_and_position_embedding/StatefulPartitionedCall2V
)transformer_block/StatefulPartitionedCall)transformer_block/StatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€»
 
_user_specified_nameinputs
¶њ
з7
!__inference__traced_restore_19303
file_prefix1
assignvariableop_dense_2_kernel: -
assignvariableop_1_dense_2_bias:3
!assignvariableop_2_dense_3_kernel:-
assignvariableop_3_dense_3_bias:X
Dassignvariableop_4_token_and_position_embedding_embedding_embeddings:
†Ь Y
Fassignvariableop_5_token_and_position_embedding_embedding_1_embeddings:	» \
Fassignvariableop_6_transformer_block_multi_head_attention_query_kernel:  V
Dassignvariableop_7_transformer_block_multi_head_attention_query_bias: Z
Dassignvariableop_8_transformer_block_multi_head_attention_key_kernel:  T
Bassignvariableop_9_transformer_block_multi_head_attention_key_bias: ]
Gassignvariableop_10_transformer_block_multi_head_attention_value_kernel:  W
Eassignvariableop_11_transformer_block_multi_head_attention_value_bias: h
Rassignvariableop_12_transformer_block_multi_head_attention_attention_output_kernel:  ^
Passignvariableop_13_transformer_block_multi_head_attention_attention_output_bias: 2
 assignvariableop_14_dense_kernel:  ,
assignvariableop_15_dense_bias: 4
"assignvariableop_16_dense_1_kernel:  .
 assignvariableop_17_dense_1_bias: M
?assignvariableop_18_transformer_block_layer_normalization_gamma: L
>assignvariableop_19_transformer_block_layer_normalization_beta: O
Aassignvariableop_20_transformer_block_layer_normalization_1_gamma: N
@assignvariableop_21_transformer_block_layer_normalization_1_beta: '
assignvariableop_22_iteration:	 +
!assignvariableop_23_learning_rate: `
Lassignvariableop_24_adam_m_token_and_position_embedding_embedding_embeddings:
†Ь `
Lassignvariableop_25_adam_v_token_and_position_embedding_embedding_embeddings:
†Ь a
Nassignvariableop_26_adam_m_token_and_position_embedding_embedding_1_embeddings:	» a
Nassignvariableop_27_adam_v_token_and_position_embedding_embedding_1_embeddings:	» d
Nassignvariableop_28_adam_m_transformer_block_multi_head_attention_query_kernel:  d
Nassignvariableop_29_adam_v_transformer_block_multi_head_attention_query_kernel:  ^
Lassignvariableop_30_adam_m_transformer_block_multi_head_attention_query_bias: ^
Lassignvariableop_31_adam_v_transformer_block_multi_head_attention_query_bias: b
Lassignvariableop_32_adam_m_transformer_block_multi_head_attention_key_kernel:  b
Lassignvariableop_33_adam_v_transformer_block_multi_head_attention_key_kernel:  \
Jassignvariableop_34_adam_m_transformer_block_multi_head_attention_key_bias: \
Jassignvariableop_35_adam_v_transformer_block_multi_head_attention_key_bias: d
Nassignvariableop_36_adam_m_transformer_block_multi_head_attention_value_kernel:  d
Nassignvariableop_37_adam_v_transformer_block_multi_head_attention_value_kernel:  ^
Lassignvariableop_38_adam_m_transformer_block_multi_head_attention_value_bias: ^
Lassignvariableop_39_adam_v_transformer_block_multi_head_attention_value_bias: o
Yassignvariableop_40_adam_m_transformer_block_multi_head_attention_attention_output_kernel:  o
Yassignvariableop_41_adam_v_transformer_block_multi_head_attention_attention_output_kernel:  e
Wassignvariableop_42_adam_m_transformer_block_multi_head_attention_attention_output_bias: e
Wassignvariableop_43_adam_v_transformer_block_multi_head_attention_attention_output_bias: 9
'assignvariableop_44_adam_m_dense_kernel:  9
'assignvariableop_45_adam_v_dense_kernel:  3
%assignvariableop_46_adam_m_dense_bias: 3
%assignvariableop_47_adam_v_dense_bias: ;
)assignvariableop_48_adam_m_dense_1_kernel:  ;
)assignvariableop_49_adam_v_dense_1_kernel:  5
'assignvariableop_50_adam_m_dense_1_bias: 5
'assignvariableop_51_adam_v_dense_1_bias: T
Fassignvariableop_52_adam_m_transformer_block_layer_normalization_gamma: T
Fassignvariableop_53_adam_v_transformer_block_layer_normalization_gamma: S
Eassignvariableop_54_adam_m_transformer_block_layer_normalization_beta: S
Eassignvariableop_55_adam_v_transformer_block_layer_normalization_beta: V
Hassignvariableop_56_adam_m_transformer_block_layer_normalization_1_gamma: V
Hassignvariableop_57_adam_v_transformer_block_layer_normalization_1_gamma: U
Gassignvariableop_58_adam_m_transformer_block_layer_normalization_1_beta: U
Gassignvariableop_59_adam_v_transformer_block_layer_normalization_1_beta: ;
)assignvariableop_60_adam_m_dense_2_kernel: ;
)assignvariableop_61_adam_v_dense_2_kernel: 5
'assignvariableop_62_adam_m_dense_2_bias:5
'assignvariableop_63_adam_v_dense_2_bias:;
)assignvariableop_64_adam_m_dense_3_kernel:;
)assignvariableop_65_adam_v_dense_3_kernel:5
'assignvariableop_66_adam_m_dense_3_bias:5
'assignvariableop_67_adam_v_dense_3_bias:%
assignvariableop_68_total_1: %
assignvariableop_69_count_1: #
assignvariableop_70_total: #
assignvariableop_71_count: 
identity_73ИҐAssignVariableOpҐAssignVariableOp_1ҐAssignVariableOp_10ҐAssignVariableOp_11ҐAssignVariableOp_12ҐAssignVariableOp_13ҐAssignVariableOp_14ҐAssignVariableOp_15ҐAssignVariableOp_16ҐAssignVariableOp_17ҐAssignVariableOp_18ҐAssignVariableOp_19ҐAssignVariableOp_2ҐAssignVariableOp_20ҐAssignVariableOp_21ҐAssignVariableOp_22ҐAssignVariableOp_23ҐAssignVariableOp_24ҐAssignVariableOp_25ҐAssignVariableOp_26ҐAssignVariableOp_27ҐAssignVariableOp_28ҐAssignVariableOp_29ҐAssignVariableOp_3ҐAssignVariableOp_30ҐAssignVariableOp_31ҐAssignVariableOp_32ҐAssignVariableOp_33ҐAssignVariableOp_34ҐAssignVariableOp_35ҐAssignVariableOp_36ҐAssignVariableOp_37ҐAssignVariableOp_38ҐAssignVariableOp_39ҐAssignVariableOp_4ҐAssignVariableOp_40ҐAssignVariableOp_41ҐAssignVariableOp_42ҐAssignVariableOp_43ҐAssignVariableOp_44ҐAssignVariableOp_45ҐAssignVariableOp_46ҐAssignVariableOp_47ҐAssignVariableOp_48ҐAssignVariableOp_49ҐAssignVariableOp_5ҐAssignVariableOp_50ҐAssignVariableOp_51ҐAssignVariableOp_52ҐAssignVariableOp_53ҐAssignVariableOp_54ҐAssignVariableOp_55ҐAssignVariableOp_56ҐAssignVariableOp_57ҐAssignVariableOp_58ҐAssignVariableOp_59ҐAssignVariableOp_6ҐAssignVariableOp_60ҐAssignVariableOp_61ҐAssignVariableOp_62ҐAssignVariableOp_63ҐAssignVariableOp_64ҐAssignVariableOp_65ҐAssignVariableOp_66ҐAssignVariableOp_67ҐAssignVariableOp_68ҐAssignVariableOp_69ҐAssignVariableOp_7ҐAssignVariableOp_70ҐAssignVariableOp_71ҐAssignVariableOp_8ҐAssignVariableOp_9з
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:I*
dtype0*Н
valueГBАIB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB&variables/8/.ATTRIBUTES/VARIABLE_VALUEB&variables/9/.ATTRIBUTES/VARIABLE_VALUEB'variables/10/.ATTRIBUTES/VARIABLE_VALUEB'variables/11/.ATTRIBUTES/VARIABLE_VALUEB'variables/12/.ATTRIBUTES/VARIABLE_VALUEB'variables/13/.ATTRIBUTES/VARIABLE_VALUEB'variables/14/.ATTRIBUTES/VARIABLE_VALUEB'variables/15/.ATTRIBUTES/VARIABLE_VALUEB'variables/16/.ATTRIBUTES/VARIABLE_VALUEB'variables/17/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/13/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/14/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/15/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/16/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/17/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/18/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/19/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/20/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/21/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/22/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/23/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/24/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/25/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/26/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/27/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/28/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/29/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/30/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/31/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/32/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/33/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/34/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/35/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/36/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/37/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/38/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/39/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/40/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/41/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/42/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/43/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/44/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHЕ
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:I*
dtype0*І
valueЭBЪIB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B О
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*Ї
_output_shapesІ
§:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*W
dtypesM
K2I	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:≤
AssignVariableOpAssignVariableOpassignvariableop_dense_2_kernelIdentity:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:ґ
AssignVariableOp_1AssignVariableOpassignvariableop_1_dense_2_biasIdentity_1:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:Є
AssignVariableOp_2AssignVariableOp!assignvariableop_2_dense_3_kernelIdentity_2:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:ґ
AssignVariableOp_3AssignVariableOpassignvariableop_3_dense_3_biasIdentity_3:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:џ
AssignVariableOp_4AssignVariableOpDassignvariableop_4_token_and_position_embedding_embedding_embeddingsIdentity_4:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:Ё
AssignVariableOp_5AssignVariableOpFassignvariableop_5_token_and_position_embedding_embedding_1_embeddingsIdentity_5:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:Ё
AssignVariableOp_6AssignVariableOpFassignvariableop_6_transformer_block_multi_head_attention_query_kernelIdentity_6:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:џ
AssignVariableOp_7AssignVariableOpDassignvariableop_7_transformer_block_multi_head_attention_query_biasIdentity_7:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:џ
AssignVariableOp_8AssignVariableOpDassignvariableop_8_transformer_block_multi_head_attention_key_kernelIdentity_8:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:ў
AssignVariableOp_9AssignVariableOpBassignvariableop_9_transformer_block_multi_head_attention_key_biasIdentity_9:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:а
AssignVariableOp_10AssignVariableOpGassignvariableop_10_transformer_block_multi_head_attention_value_kernelIdentity_10:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:ё
AssignVariableOp_11AssignVariableOpEassignvariableop_11_transformer_block_multi_head_attention_value_biasIdentity_11:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:л
AssignVariableOp_12AssignVariableOpRassignvariableop_12_transformer_block_multi_head_attention_attention_output_kernelIdentity_12:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:й
AssignVariableOp_13AssignVariableOpPassignvariableop_13_transformer_block_multi_head_attention_attention_output_biasIdentity_13:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:є
AssignVariableOp_14AssignVariableOp assignvariableop_14_dense_kernelIdentity_14:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:Ј
AssignVariableOp_15AssignVariableOpassignvariableop_15_dense_biasIdentity_15:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:ї
AssignVariableOp_16AssignVariableOp"assignvariableop_16_dense_1_kernelIdentity_16:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:є
AssignVariableOp_17AssignVariableOp assignvariableop_17_dense_1_biasIdentity_17:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:Ў
AssignVariableOp_18AssignVariableOp?assignvariableop_18_transformer_block_layer_normalization_gammaIdentity_18:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:„
AssignVariableOp_19AssignVariableOp>assignvariableop_19_transformer_block_layer_normalization_betaIdentity_19:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:Џ
AssignVariableOp_20AssignVariableOpAassignvariableop_20_transformer_block_layer_normalization_1_gammaIdentity_20:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:ў
AssignVariableOp_21AssignVariableOp@assignvariableop_21_transformer_block_layer_normalization_1_betaIdentity_21:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0	*
_output_shapes
:ґ
AssignVariableOp_22AssignVariableOpassignvariableop_22_iterationIdentity_22:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:Ї
AssignVariableOp_23AssignVariableOp!assignvariableop_23_learning_rateIdentity_23:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:е
AssignVariableOp_24AssignVariableOpLassignvariableop_24_adam_m_token_and_position_embedding_embedding_embeddingsIdentity_24:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:е
AssignVariableOp_25AssignVariableOpLassignvariableop_25_adam_v_token_and_position_embedding_embedding_embeddingsIdentity_25:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:з
AssignVariableOp_26AssignVariableOpNassignvariableop_26_adam_m_token_and_position_embedding_embedding_1_embeddingsIdentity_26:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:з
AssignVariableOp_27AssignVariableOpNassignvariableop_27_adam_v_token_and_position_embedding_embedding_1_embeddingsIdentity_27:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:з
AssignVariableOp_28AssignVariableOpNassignvariableop_28_adam_m_transformer_block_multi_head_attention_query_kernelIdentity_28:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:з
AssignVariableOp_29AssignVariableOpNassignvariableop_29_adam_v_transformer_block_multi_head_attention_query_kernelIdentity_29:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:е
AssignVariableOp_30AssignVariableOpLassignvariableop_30_adam_m_transformer_block_multi_head_attention_query_biasIdentity_30:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:е
AssignVariableOp_31AssignVariableOpLassignvariableop_31_adam_v_transformer_block_multi_head_attention_query_biasIdentity_31:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:е
AssignVariableOp_32AssignVariableOpLassignvariableop_32_adam_m_transformer_block_multi_head_attention_key_kernelIdentity_32:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:е
AssignVariableOp_33AssignVariableOpLassignvariableop_33_adam_v_transformer_block_multi_head_attention_key_kernelIdentity_33:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:г
AssignVariableOp_34AssignVariableOpJassignvariableop_34_adam_m_transformer_block_multi_head_attention_key_biasIdentity_34:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:г
AssignVariableOp_35AssignVariableOpJassignvariableop_35_adam_v_transformer_block_multi_head_attention_key_biasIdentity_35:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:з
AssignVariableOp_36AssignVariableOpNassignvariableop_36_adam_m_transformer_block_multi_head_attention_value_kernelIdentity_36:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:з
AssignVariableOp_37AssignVariableOpNassignvariableop_37_adam_v_transformer_block_multi_head_attention_value_kernelIdentity_37:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:е
AssignVariableOp_38AssignVariableOpLassignvariableop_38_adam_m_transformer_block_multi_head_attention_value_biasIdentity_38:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:е
AssignVariableOp_39AssignVariableOpLassignvariableop_39_adam_v_transformer_block_multi_head_attention_value_biasIdentity_39:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:т
AssignVariableOp_40AssignVariableOpYassignvariableop_40_adam_m_transformer_block_multi_head_attention_attention_output_kernelIdentity_40:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:т
AssignVariableOp_41AssignVariableOpYassignvariableop_41_adam_v_transformer_block_multi_head_attention_attention_output_kernelIdentity_41:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:р
AssignVariableOp_42AssignVariableOpWassignvariableop_42_adam_m_transformer_block_multi_head_attention_attention_output_biasIdentity_42:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:р
AssignVariableOp_43AssignVariableOpWassignvariableop_43_adam_v_transformer_block_multi_head_attention_attention_output_biasIdentity_43:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:ј
AssignVariableOp_44AssignVariableOp'assignvariableop_44_adam_m_dense_kernelIdentity_44:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_45IdentityRestoreV2:tensors:45"/device:CPU:0*
T0*
_output_shapes
:ј
AssignVariableOp_45AssignVariableOp'assignvariableop_45_adam_v_dense_kernelIdentity_45:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_46IdentityRestoreV2:tensors:46"/device:CPU:0*
T0*
_output_shapes
:Њ
AssignVariableOp_46AssignVariableOp%assignvariableop_46_adam_m_dense_biasIdentity_46:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_47IdentityRestoreV2:tensors:47"/device:CPU:0*
T0*
_output_shapes
:Њ
AssignVariableOp_47AssignVariableOp%assignvariableop_47_adam_v_dense_biasIdentity_47:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_48IdentityRestoreV2:tensors:48"/device:CPU:0*
T0*
_output_shapes
:¬
AssignVariableOp_48AssignVariableOp)assignvariableop_48_adam_m_dense_1_kernelIdentity_48:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_49IdentityRestoreV2:tensors:49"/device:CPU:0*
T0*
_output_shapes
:¬
AssignVariableOp_49AssignVariableOp)assignvariableop_49_adam_v_dense_1_kernelIdentity_49:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_50IdentityRestoreV2:tensors:50"/device:CPU:0*
T0*
_output_shapes
:ј
AssignVariableOp_50AssignVariableOp'assignvariableop_50_adam_m_dense_1_biasIdentity_50:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_51IdentityRestoreV2:tensors:51"/device:CPU:0*
T0*
_output_shapes
:ј
AssignVariableOp_51AssignVariableOp'assignvariableop_51_adam_v_dense_1_biasIdentity_51:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_52IdentityRestoreV2:tensors:52"/device:CPU:0*
T0*
_output_shapes
:я
AssignVariableOp_52AssignVariableOpFassignvariableop_52_adam_m_transformer_block_layer_normalization_gammaIdentity_52:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_53IdentityRestoreV2:tensors:53"/device:CPU:0*
T0*
_output_shapes
:я
AssignVariableOp_53AssignVariableOpFassignvariableop_53_adam_v_transformer_block_layer_normalization_gammaIdentity_53:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_54IdentityRestoreV2:tensors:54"/device:CPU:0*
T0*
_output_shapes
:ё
AssignVariableOp_54AssignVariableOpEassignvariableop_54_adam_m_transformer_block_layer_normalization_betaIdentity_54:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_55IdentityRestoreV2:tensors:55"/device:CPU:0*
T0*
_output_shapes
:ё
AssignVariableOp_55AssignVariableOpEassignvariableop_55_adam_v_transformer_block_layer_normalization_betaIdentity_55:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_56IdentityRestoreV2:tensors:56"/device:CPU:0*
T0*
_output_shapes
:б
AssignVariableOp_56AssignVariableOpHassignvariableop_56_adam_m_transformer_block_layer_normalization_1_gammaIdentity_56:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_57IdentityRestoreV2:tensors:57"/device:CPU:0*
T0*
_output_shapes
:б
AssignVariableOp_57AssignVariableOpHassignvariableop_57_adam_v_transformer_block_layer_normalization_1_gammaIdentity_57:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_58IdentityRestoreV2:tensors:58"/device:CPU:0*
T0*
_output_shapes
:а
AssignVariableOp_58AssignVariableOpGassignvariableop_58_adam_m_transformer_block_layer_normalization_1_betaIdentity_58:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_59IdentityRestoreV2:tensors:59"/device:CPU:0*
T0*
_output_shapes
:а
AssignVariableOp_59AssignVariableOpGassignvariableop_59_adam_v_transformer_block_layer_normalization_1_betaIdentity_59:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_60IdentityRestoreV2:tensors:60"/device:CPU:0*
T0*
_output_shapes
:¬
AssignVariableOp_60AssignVariableOp)assignvariableop_60_adam_m_dense_2_kernelIdentity_60:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_61IdentityRestoreV2:tensors:61"/device:CPU:0*
T0*
_output_shapes
:¬
AssignVariableOp_61AssignVariableOp)assignvariableop_61_adam_v_dense_2_kernelIdentity_61:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_62IdentityRestoreV2:tensors:62"/device:CPU:0*
T0*
_output_shapes
:ј
AssignVariableOp_62AssignVariableOp'assignvariableop_62_adam_m_dense_2_biasIdentity_62:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_63IdentityRestoreV2:tensors:63"/device:CPU:0*
T0*
_output_shapes
:ј
AssignVariableOp_63AssignVariableOp'assignvariableop_63_adam_v_dense_2_biasIdentity_63:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_64IdentityRestoreV2:tensors:64"/device:CPU:0*
T0*
_output_shapes
:¬
AssignVariableOp_64AssignVariableOp)assignvariableop_64_adam_m_dense_3_kernelIdentity_64:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_65IdentityRestoreV2:tensors:65"/device:CPU:0*
T0*
_output_shapes
:¬
AssignVariableOp_65AssignVariableOp)assignvariableop_65_adam_v_dense_3_kernelIdentity_65:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_66IdentityRestoreV2:tensors:66"/device:CPU:0*
T0*
_output_shapes
:ј
AssignVariableOp_66AssignVariableOp'assignvariableop_66_adam_m_dense_3_biasIdentity_66:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_67IdentityRestoreV2:tensors:67"/device:CPU:0*
T0*
_output_shapes
:ј
AssignVariableOp_67AssignVariableOp'assignvariableop_67_adam_v_dense_3_biasIdentity_67:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_68IdentityRestoreV2:tensors:68"/device:CPU:0*
T0*
_output_shapes
:і
AssignVariableOp_68AssignVariableOpassignvariableop_68_total_1Identity_68:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_69IdentityRestoreV2:tensors:69"/device:CPU:0*
T0*
_output_shapes
:і
AssignVariableOp_69AssignVariableOpassignvariableop_69_count_1Identity_69:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_70IdentityRestoreV2:tensors:70"/device:CPU:0*
T0*
_output_shapes
:≤
AssignVariableOp_70AssignVariableOpassignvariableop_70_totalIdentity_70:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_71IdentityRestoreV2:tensors:71"/device:CPU:0*
T0*
_output_shapes
:≤
AssignVariableOp_71AssignVariableOpassignvariableop_71_countIdentity_71:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0Y
NoOpNoOp"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 €
Identity_72Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_70^AssignVariableOp_71^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_73IdentityIdentity_72:output:0^NoOp_1*
T0*
_output_shapes
: м
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_70^AssignVariableOp_71^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_73Identity_73:output:0*І
_input_shapesХ
Т: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442*
AssignVariableOp_45AssignVariableOp_452*
AssignVariableOp_46AssignVariableOp_462*
AssignVariableOp_47AssignVariableOp_472*
AssignVariableOp_48AssignVariableOp_482*
AssignVariableOp_49AssignVariableOp_492(
AssignVariableOp_5AssignVariableOp_52*
AssignVariableOp_50AssignVariableOp_502*
AssignVariableOp_51AssignVariableOp_512*
AssignVariableOp_52AssignVariableOp_522*
AssignVariableOp_53AssignVariableOp_532*
AssignVariableOp_54AssignVariableOp_542*
AssignVariableOp_55AssignVariableOp_552*
AssignVariableOp_56AssignVariableOp_562*
AssignVariableOp_57AssignVariableOp_572*
AssignVariableOp_58AssignVariableOp_582*
AssignVariableOp_59AssignVariableOp_592(
AssignVariableOp_6AssignVariableOp_62*
AssignVariableOp_60AssignVariableOp_602*
AssignVariableOp_61AssignVariableOp_612*
AssignVariableOp_62AssignVariableOp_622*
AssignVariableOp_63AssignVariableOp_632*
AssignVariableOp_64AssignVariableOp_642*
AssignVariableOp_65AssignVariableOp_652*
AssignVariableOp_66AssignVariableOp_662*
AssignVariableOp_67AssignVariableOp_672*
AssignVariableOp_68AssignVariableOp_682*
AssignVariableOp_69AssignVariableOp_692(
AssignVariableOp_7AssignVariableOp_72*
AssignVariableOp_70AssignVariableOp_702*
AssignVariableOp_71AssignVariableOp_712(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
Ђ
J
"__inference__update_step_xla_18080
gradient
variable: *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

: : *
	_noinline(:D @

_output_shapes
: 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
¶
ч
@__inference_dense_layer_call_and_return_conditional_losses_18799

inputs3
!tensordot_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identityИҐBiasAdd/ReadVariableOpҐTensordot/ReadVariableOpz
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ї
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : њ
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Ь
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:z
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» К
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€К
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ [
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : І
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Д
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» U
ReluReluBiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€» f
IdentityIdentityRelu:activations:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€» : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
’
Ф
'__inference_dense_1_layer_call_fn_18808

inputs
unknown:  
	unknown_0: 
identityИҐStatefulPartitionedCallя
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_16489t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€» : : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
п
Ђ
<__inference_token_and_position_embedding_layer_call_fn_18149
x
unknown:	» 
	unknown_0:
†Ь 
identityИҐStatefulPartitionedCallп
StatefulPartitionedCallStatefulPartitionedCallxunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *`
f[RY
W__inference_token_and_position_embedding_layer_call_and_return_conditional_losses_16651t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:€€€€€€€€€»: : 22
StatefulPartitionedCallStatefulPartitionedCall:K G
(
_output_shapes
:€€€€€€€€€»

_user_specified_namex
ѓ
Ќ
*__inference_sequential_layer_call_fn_18632

inputs
unknown:  
	unknown_0: 
	unknown_1:  
	unknown_2: 
identityИҐStatefulPartitionedCallь
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_16496t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :€€€€€€€€€» : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
Ј
N
"__inference__update_step_xla_18135
gradient
variable:*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes
:: *
	_noinline(:H D

_output_shapes

:
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Ђ
J
"__inference__update_step_xla_18130
gradient
variable:*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

:: *
	_noinline(:D @

_output_shapes
:
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
К

c
D__inference_dropout_2_layer_call_and_return_conditional_losses_16978

inputs
identityИR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *д8О?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€ C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:М
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:€€€€€€€€€ *
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ќћћ=¶
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€ T
dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    У
dropout/SelectV2SelectV2dropout/GreaterEqual:z:0dropout/Mul:z:0dropout/Const_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€ a
IdentityIdentitydropout/SelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€ "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€ :O K
'
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
“=
ћ
E__inference_sequential_layer_call_and_return_conditional_losses_18759

inputs9
'dense_tensordot_readvariableop_resource:  3
%dense_biasadd_readvariableop_resource: ;
)dense_1_tensordot_readvariableop_resource:  5
'dense_1_biasadd_readvariableop_resource: 
identityИҐdense/BiasAdd/ReadVariableOpҐdense/Tensordot/ReadVariableOpҐdense_1/BiasAdd/ReadVariableOpҐ dense_1/Tensordot/ReadVariableOpЖ
dense/Tensordot/ReadVariableOpReadVariableOp'dense_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0^
dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:e
dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       K
dense/Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:_
dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ”
dense/Tensordot/GatherV2GatherV2dense/Tensordot/Shape:output:0dense/Tensordot/free:output:0&dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : „
dense/Tensordot/GatherV2_1GatherV2dense/Tensordot/Shape:output:0dense/Tensordot/axes:output:0(dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:_
dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: А
dense/Tensordot/ProdProd!dense/Tensordot/GatherV2:output:0dense/Tensordot/Const:output:0*
T0*
_output_shapes
: a
dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: Ж
dense/Tensordot/Prod_1Prod#dense/Tensordot/GatherV2_1:output:0 dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: ]
dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : і
dense/Tensordot/concatConcatV2dense/Tensordot/free:output:0dense/Tensordot/axes:output:0$dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:Л
dense/Tensordot/stackPackdense/Tensordot/Prod:output:0dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Ж
dense/Tensordot/transpose	Transposeinputsdense/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ь
dense/Tensordot/ReshapeReshapedense/Tensordot/transpose:y:0dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Ь
dense/Tensordot/MatMulMatMul dense/Tensordot/Reshape:output:0&dense/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ a
dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: _
dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : њ
dense/Tensordot/concat_1ConcatV2!dense/Tensordot/GatherV2:output:0 dense/Tensordot/Const_2:output:0&dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Ц
dense/TensordotReshape dense/Tensordot/MatMul:product:0!dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» ~
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0П
dense/BiasAddBiasAdddense/Tensordot:output:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» a

dense/ReluReludense/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€» К
 dense_1/Tensordot/ReadVariableOpReadVariableOp)dense_1_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0`
dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:g
dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       _
dense_1/Tensordot/ShapeShapedense/Relu:activations:0*
T0*
_output_shapes
:a
dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : џ
dense_1/Tensordot/GatherV2GatherV2 dense_1/Tensordot/Shape:output:0dense_1/Tensordot/free:output:0(dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:c
!dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : я
dense_1/Tensordot/GatherV2_1GatherV2 dense_1/Tensordot/Shape:output:0dense_1/Tensordot/axes:output:0*dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: Ж
dense_1/Tensordot/ProdProd#dense_1/Tensordot/GatherV2:output:0 dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: М
dense_1/Tensordot/Prod_1Prod%dense_1/Tensordot/GatherV2_1:output:0"dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Љ
dense_1/Tensordot/concatConcatV2dense_1/Tensordot/free:output:0dense_1/Tensordot/axes:output:0&dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:С
dense_1/Tensordot/stackPackdense_1/Tensordot/Prod:output:0!dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Ь
dense_1/Tensordot/transpose	Transposedense/Relu:activations:0!dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ґ
dense_1/Tensordot/ReshapeReshapedense_1/Tensordot/transpose:y:0 dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Ґ
dense_1/Tensordot/MatMulMatMul"dense_1/Tensordot/Reshape:output:0(dense_1/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ c
dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: a
dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : «
dense_1/Tensordot/concat_1ConcatV2#dense_1/Tensordot/GatherV2:output:0"dense_1/Tensordot/Const_2:output:0(dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Ь
dense_1/TensordotReshape"dense_1/Tensordot/MatMul:product:0#dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» В
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0Х
dense_1/BiasAddBiasAdddense_1/Tensordot:output:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» l
IdentityIdentitydense_1/BiasAdd:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€»  
NoOpNoOp^dense/BiasAdd/ReadVariableOp^dense/Tensordot/ReadVariableOp^dense_1/BiasAdd/ReadVariableOp!^dense_1/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :€€€€€€€€€» : : : : 2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2@
dense/Tensordot/ReadVariableOpdense/Tensordot/ReadVariableOp2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2D
 dense_1/Tensordot/ReadVariableOp dense_1/Tensordot/ReadVariableOp:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
э
Ъ
W__inference_token_and_position_embedding_layer_call_and_return_conditional_losses_16651
x5
"embedding_1_embedding_lookup_16639:	» 4
 embedding_embedding_lookup_16644:
†Ь 
identityИҐembedding/embedding_lookupҐembedding_1/embedding_lookup6
ShapeShapex*
T0*
_output_shapes
:f
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
€€€€€€€€€_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskM
range/startConst*
_output_shapes
: *
dtype0*
value	B : M
range/deltaConst*
_output_shapes
: *
dtype0*
value	B :o
rangeRangerange/start:output:0strided_slice:output:0range/delta:output:0*
_output_shapes	
:»„
embedding_1/embedding_lookupResourceGather"embedding_1_embedding_lookup_16639range:output:0*
Tindices0*5
_class+
)'loc:@embedding_1/embedding_lookup/16639*
_output_shapes
:	» *
dtype0є
%embedding_1/embedding_lookup/IdentityIdentity%embedding_1/embedding_lookup:output:0*
T0*5
_class+
)'loc:@embedding_1/embedding_lookup/16639*
_output_shapes
:	» Н
'embedding_1/embedding_lookup/Identity_1Identity.embedding_1/embedding_lookup/Identity:output:0*
T0*
_output_shapes
:	» —
embedding/embedding_lookupResourceGather embedding_embedding_lookup_16644x*
Tindices0*3
_class)
'%loc:@embedding/embedding_lookup/16644*,
_output_shapes
:€€€€€€€€€» *
dtype0ј
#embedding/embedding_lookup/IdentityIdentity#embedding/embedding_lookup:output:0*
T0*3
_class)
'%loc:@embedding/embedding_lookup/16644*,
_output_shapes
:€€€€€€€€€» Ц
%embedding/embedding_lookup/Identity_1Identity,embedding/embedding_lookup/Identity:output:0*
T0*,
_output_shapes
:€€€€€€€€€» •
addAddV2.embedding/embedding_lookup/Identity_1:output:00embedding_1/embedding_lookup/Identity_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» [
IdentityIdentityadd:z:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» В
NoOpNoOp^embedding/embedding_lookup^embedding_1/embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:€€€€€€€€€»: : 28
embedding/embedding_lookupembedding/embedding_lookup2<
embedding_1/embedding_lookupembedding_1/embedding_lookup:K G
(
_output_shapes
:€€€€€€€€€»

_user_specified_namex
∆є
Ш
@__inference_model_layer_call_and_return_conditional_losses_18026

inputsR
?token_and_position_embedding_embedding_1_embedding_lookup_17845:	» Q
=token_and_position_embedding_embedding_embedding_lookup_17850:
†Ь h
Rtransformer_block_multi_head_attention_query_einsum_einsum_readvariableop_resource:  Z
Htransformer_block_multi_head_attention_query_add_readvariableop_resource: f
Ptransformer_block_multi_head_attention_key_einsum_einsum_readvariableop_resource:  X
Ftransformer_block_multi_head_attention_key_add_readvariableop_resource: h
Rtransformer_block_multi_head_attention_value_einsum_einsum_readvariableop_resource:  Z
Htransformer_block_multi_head_attention_value_add_readvariableop_resource: s
]transformer_block_multi_head_attention_attention_output_einsum_einsum_readvariableop_resource:  a
Stransformer_block_multi_head_attention_attention_output_add_readvariableop_resource: Y
Ktransformer_block_layer_normalization_batchnorm_mul_readvariableop_resource: U
Gtransformer_block_layer_normalization_batchnorm_readvariableop_resource: V
Dtransformer_block_sequential_dense_tensordot_readvariableop_resource:  P
Btransformer_block_sequential_dense_biasadd_readvariableop_resource: X
Ftransformer_block_sequential_dense_1_tensordot_readvariableop_resource:  R
Dtransformer_block_sequential_dense_1_biasadd_readvariableop_resource: [
Mtransformer_block_layer_normalization_1_batchnorm_mul_readvariableop_resource: W
Itransformer_block_layer_normalization_1_batchnorm_readvariableop_resource: 8
&dense_2_matmul_readvariableop_resource: 5
'dense_2_biasadd_readvariableop_resource:8
&dense_3_matmul_readvariableop_resource:5
'dense_3_biasadd_readvariableop_resource:
identityИҐdense_2/BiasAdd/ReadVariableOpҐdense_2/MatMul/ReadVariableOpҐdense_3/BiasAdd/ReadVariableOpҐdense_3/MatMul/ReadVariableOpҐ7token_and_position_embedding/embedding/embedding_lookupҐ9token_and_position_embedding/embedding_1/embedding_lookupҐ>transformer_block/layer_normalization/batchnorm/ReadVariableOpҐBtransformer_block/layer_normalization/batchnorm/mul/ReadVariableOpҐ@transformer_block/layer_normalization_1/batchnorm/ReadVariableOpҐDtransformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOpҐJtransformer_block/multi_head_attention/attention_output/add/ReadVariableOpҐTtransformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpҐ=transformer_block/multi_head_attention/key/add/ReadVariableOpҐGtransformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOpҐ?transformer_block/multi_head_attention/query/add/ReadVariableOpҐItransformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOpҐ?transformer_block/multi_head_attention/value/add/ReadVariableOpҐItransformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOpҐ9transformer_block/sequential/dense/BiasAdd/ReadVariableOpҐ;transformer_block/sequential/dense/Tensordot/ReadVariableOpҐ;transformer_block/sequential/dense_1/BiasAdd/ReadVariableOpҐ=transformer_block/sequential/dense_1/Tensordot/ReadVariableOpX
"token_and_position_embedding/ShapeShapeinputs*
T0*
_output_shapes
:Г
0token_and_position_embedding/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
€€€€€€€€€|
2token_and_position_embedding/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: |
2token_and_position_embedding/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:в
*token_and_position_embedding/strided_sliceStridedSlice+token_and_position_embedding/Shape:output:09token_and_position_embedding/strided_slice/stack:output:0;token_and_position_embedding/strided_slice/stack_1:output:0;token_and_position_embedding/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskj
(token_and_position_embedding/range/startConst*
_output_shapes
: *
dtype0*
value	B : j
(token_and_position_embedding/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :г
"token_and_position_embedding/rangeRange1token_and_position_embedding/range/start:output:03token_and_position_embedding/strided_slice:output:01token_and_position_embedding/range/delta:output:0*
_output_shapes	
:»Ћ
9token_and_position_embedding/embedding_1/embedding_lookupResourceGather?token_and_position_embedding_embedding_1_embedding_lookup_17845+token_and_position_embedding/range:output:0*
Tindices0*R
_classH
FDloc:@token_and_position_embedding/embedding_1/embedding_lookup/17845*
_output_shapes
:	» *
dtype0Р
Btoken_and_position_embedding/embedding_1/embedding_lookup/IdentityIdentityBtoken_and_position_embedding/embedding_1/embedding_lookup:output:0*
T0*R
_classH
FDloc:@token_and_position_embedding/embedding_1/embedding_lookup/17845*
_output_shapes
:	» «
Dtoken_and_position_embedding/embedding_1/embedding_lookup/Identity_1IdentityKtoken_and_position_embedding/embedding_1/embedding_lookup/Identity:output:0*
T0*
_output_shapes
:	» ≠
7token_and_position_embedding/embedding/embedding_lookupResourceGather=token_and_position_embedding_embedding_embedding_lookup_17850inputs*
Tindices0*P
_classF
DBloc:@token_and_position_embedding/embedding/embedding_lookup/17850*,
_output_shapes
:€€€€€€€€€» *
dtype0Ч
@token_and_position_embedding/embedding/embedding_lookup/IdentityIdentity@token_and_position_embedding/embedding/embedding_lookup:output:0*
T0*P
_classF
DBloc:@token_and_position_embedding/embedding/embedding_lookup/17850*,
_output_shapes
:€€€€€€€€€» –
Btoken_and_position_embedding/embedding/embedding_lookup/Identity_1IdentityItoken_and_position_embedding/embedding/embedding_lookup/Identity:output:0*
T0*,
_output_shapes
:€€€€€€€€€» ь
 token_and_position_embedding/addAddV2Ktoken_and_position_embedding/embedding/embedding_lookup/Identity_1:output:0Mtoken_and_position_embedding/embedding_1/embedding_lookup/Identity_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» а
Itransformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOpRtransformer_block_multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Ю
:transformer_block/multi_head_attention/query/einsum/EinsumEinsum$token_and_position_embedding/add:z:0Qtransformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde»
?transformer_block/multi_head_attention/query/add/ReadVariableOpReadVariableOpHtransformer_block_multi_head_attention_query_add_readvariableop_resource*
_output_shapes

: *
dtype0В
0transformer_block/multi_head_attention/query/addAddV2Ctransformer_block/multi_head_attention/query/einsum/Einsum:output:0Gtransformer_block/multi_head_attention/query/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» №
Gtransformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOpPtransformer_block_multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Ъ
8transformer_block/multi_head_attention/key/einsum/EinsumEinsum$token_and_position_embedding/add:z:0Otransformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abdeƒ
=transformer_block/multi_head_attention/key/add/ReadVariableOpReadVariableOpFtransformer_block_multi_head_attention_key_add_readvariableop_resource*
_output_shapes

: *
dtype0ь
.transformer_block/multi_head_attention/key/addAddV2Atransformer_block/multi_head_attention/key/einsum/Einsum:output:0Etransformer_block/multi_head_attention/key/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» а
Itransformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOpRtransformer_block_multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Ю
:transformer_block/multi_head_attention/value/einsum/EinsumEinsum$token_and_position_embedding/add:z:0Qtransformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde»
?transformer_block/multi_head_attention/value/add/ReadVariableOpReadVariableOpHtransformer_block_multi_head_attention_value_add_readvariableop_resource*
_output_shapes

: *
dtype0В
0transformer_block/multi_head_attention/value/addAddV2Ctransformer_block/multi_head_attention/value/einsum/Einsum:output:0Gtransformer_block/multi_head_attention/value/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» q
,transformer_block/multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *у5>ў
*transformer_block/multi_head_attention/MulMul4transformer_block/multi_head_attention/query/add:z:05transformer_block/multi_head_attention/Mul/y:output:0*
T0*0
_output_shapes
:€€€€€€€€€» Ж
4transformer_block/multi_head_attention/einsum/EinsumEinsum2transformer_block/multi_head_attention/key/add:z:0.transformer_block/multi_head_attention/Mul:z:0*
N*
T0*1
_output_shapes
:€€€€€€€€€»»*
equationaecd,abcd->acbeЉ
6transformer_block/multi_head_attention/softmax/SoftmaxSoftmax=transformer_block/multi_head_attention/einsum/Einsum:output:0*
T0*1
_output_shapes
:€€€€€€€€€»»Ѕ
7transformer_block/multi_head_attention/dropout/IdentityIdentity@transformer_block/multi_head_attention/softmax/Softmax:softmax:0*
T0*1
_output_shapes
:€€€€€€€€€»»Ы
6transformer_block/multi_head_attention/einsum_1/EinsumEinsum@transformer_block/multi_head_attention/dropout/Identity:output:04transformer_block/multi_head_attention/value/add:z:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationacbe,aecd->abcdц
Ttransformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOp]transformer_block_multi_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Ћ
Etransformer_block/multi_head_attention/attention_output/einsum/EinsumEinsum?transformer_block/multi_head_attention/einsum_1/Einsum:output:0\transformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*,
_output_shapes
:€€€€€€€€€» *
equationabcd,cde->abeЏ
Jtransformer_block/multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpStransformer_block_multi_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
: *
dtype0Я
;transformer_block/multi_head_attention/attention_output/addAddV2Ntransformer_block/multi_head_attention/attention_output/einsum/Einsum:output:0Rtransformer_block/multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» l
'transformer_block/dropout/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *д8О?÷
%transformer_block/dropout/dropout/MulMul?transformer_block/multi_head_attention/attention_output/add:z:00transformer_block/dropout/dropout/Const:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ц
'transformer_block/dropout/dropout/ShapeShape?transformer_block/multi_head_attention/attention_output/add:z:0*
T0*
_output_shapes
:≈
>transformer_block/dropout/dropout/random_uniform/RandomUniformRandomUniform0transformer_block/dropout/dropout/Shape:output:0*
T0*,
_output_shapes
:€€€€€€€€€» *
dtype0u
0transformer_block/dropout/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ќћћ=щ
.transformer_block/dropout/dropout/GreaterEqualGreaterEqualGtransformer_block/dropout/dropout/random_uniform/RandomUniform:output:09transformer_block/dropout/dropout/GreaterEqual/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€» n
)transformer_block/dropout/dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    А
*transformer_block/dropout/dropout/SelectV2SelectV22transformer_block/dropout/dropout/GreaterEqual:z:0)transformer_block/dropout/dropout/Mul:z:02transformer_block/dropout/dropout/Const_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» ∞
transformer_block/addAddV2$token_and_position_embedding/add:z:03transformer_block/dropout/dropout/SelectV2:output:0*
T0*,
_output_shapes
:€€€€€€€€€» О
Dtransformer_block/layer_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:м
2transformer_block/layer_normalization/moments/meanMeantransformer_block/add:z:0Mtransformer_block/layer_normalization/moments/mean/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(Њ
:transformer_block/layer_normalization/moments/StopGradientStopGradient;transformer_block/layer_normalization/moments/mean:output:0*
T0*,
_output_shapes
:€€€€€€€€€»л
?transformer_block/layer_normalization/moments/SquaredDifferenceSquaredDifferencetransformer_block/add:z:0Ctransformer_block/layer_normalization/moments/StopGradient:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Т
Htransformer_block/layer_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:Ю
6transformer_block/layer_normalization/moments/varianceMeanCtransformer_block/layer_normalization/moments/SquaredDifference:z:0Qtransformer_block/layer_normalization/moments/variance/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(z
5transformer_block/layer_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *љ7Ж5ф
3transformer_block/layer_normalization/batchnorm/addAddV2?transformer_block/layer_normalization/moments/variance:output:0>transformer_block/layer_normalization/batchnorm/add/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€»Ѓ
5transformer_block/layer_normalization/batchnorm/RsqrtRsqrt7transformer_block/layer_normalization/batchnorm/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€» 
Btransformer_block/layer_normalization/batchnorm/mul/ReadVariableOpReadVariableOpKtransformer_block_layer_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0ш
3transformer_block/layer_normalization/batchnorm/mulMul9transformer_block/layer_normalization/batchnorm/Rsqrt:y:0Jtransformer_block/layer_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» «
5transformer_block/layer_normalization/batchnorm/mul_1Multransformer_block/add:z:07transformer_block/layer_normalization/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» й
5transformer_block/layer_normalization/batchnorm/mul_2Mul;transformer_block/layer_normalization/moments/mean:output:07transformer_block/layer_normalization/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ¬
>transformer_block/layer_normalization/batchnorm/ReadVariableOpReadVariableOpGtransformer_block_layer_normalization_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0ф
3transformer_block/layer_normalization/batchnorm/subSubFtransformer_block/layer_normalization/batchnorm/ReadVariableOp:value:09transformer_block/layer_normalization/batchnorm/mul_2:z:0*
T0*,
_output_shapes
:€€€€€€€€€» й
5transformer_block/layer_normalization/batchnorm/add_1AddV29transformer_block/layer_normalization/batchnorm/mul_1:z:07transformer_block/layer_normalization/batchnorm/sub:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ј
;transformer_block/sequential/dense/Tensordot/ReadVariableOpReadVariableOpDtransformer_block_sequential_dense_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0{
1transformer_block/sequential/dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:В
1transformer_block/sequential/dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Ы
2transformer_block/sequential/dense/Tensordot/ShapeShape9transformer_block/layer_normalization/batchnorm/add_1:z:0*
T0*
_output_shapes
:|
:transformer_block/sequential/dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : «
5transformer_block/sequential/dense/Tensordot/GatherV2GatherV2;transformer_block/sequential/dense/Tensordot/Shape:output:0:transformer_block/sequential/dense/Tensordot/free:output:0Ctransformer_block/sequential/dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:~
<transformer_block/sequential/dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ћ
7transformer_block/sequential/dense/Tensordot/GatherV2_1GatherV2;transformer_block/sequential/dense/Tensordot/Shape:output:0:transformer_block/sequential/dense/Tensordot/axes:output:0Etransformer_block/sequential/dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:|
2transformer_block/sequential/dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: „
1transformer_block/sequential/dense/Tensordot/ProdProd>transformer_block/sequential/dense/Tensordot/GatherV2:output:0;transformer_block/sequential/dense/Tensordot/Const:output:0*
T0*
_output_shapes
: ~
4transformer_block/sequential/dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: Ё
3transformer_block/sequential/dense/Tensordot/Prod_1Prod@transformer_block/sequential/dense/Tensordot/GatherV2_1:output:0=transformer_block/sequential/dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: z
8transformer_block/sequential/dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ®
3transformer_block/sequential/dense/Tensordot/concatConcatV2:transformer_block/sequential/dense/Tensordot/free:output:0:transformer_block/sequential/dense/Tensordot/axes:output:0Atransformer_block/sequential/dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:в
2transformer_block/sequential/dense/Tensordot/stackPack:transformer_block/sequential/dense/Tensordot/Prod:output:0<transformer_block/sequential/dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:у
6transformer_block/sequential/dense/Tensordot/transpose	Transpose9transformer_block/layer_normalization/batchnorm/add_1:z:0<transformer_block/sequential/dense/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» у
4transformer_block/sequential/dense/Tensordot/ReshapeReshape:transformer_block/sequential/dense/Tensordot/transpose:y:0;transformer_block/sequential/dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€у
3transformer_block/sequential/dense/Tensordot/MatMulMatMul=transformer_block/sequential/dense/Tensordot/Reshape:output:0Ctransformer_block/sequential/dense/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ ~
4transformer_block/sequential/dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: |
:transformer_block/sequential/dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ≥
5transformer_block/sequential/dense/Tensordot/concat_1ConcatV2>transformer_block/sequential/dense/Tensordot/GatherV2:output:0=transformer_block/sequential/dense/Tensordot/Const_2:output:0Ctransformer_block/sequential/dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:н
,transformer_block/sequential/dense/TensordotReshape=transformer_block/sequential/dense/Tensordot/MatMul:product:0>transformer_block/sequential/dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Є
9transformer_block/sequential/dense/BiasAdd/ReadVariableOpReadVariableOpBtransformer_block_sequential_dense_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0ж
*transformer_block/sequential/dense/BiasAddBiasAdd5transformer_block/sequential/dense/Tensordot:output:0Atransformer_block/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» Ы
'transformer_block/sequential/dense/ReluRelu3transformer_block/sequential/dense/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€» ƒ
=transformer_block/sequential/dense_1/Tensordot/ReadVariableOpReadVariableOpFtransformer_block_sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0}
3transformer_block/sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:Д
3transformer_block/sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Щ
4transformer_block/sequential/dense_1/Tensordot/ShapeShape5transformer_block/sequential/dense/Relu:activations:0*
T0*
_output_shapes
:~
<transformer_block/sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ѕ
7transformer_block/sequential/dense_1/Tensordot/GatherV2GatherV2=transformer_block/sequential/dense_1/Tensordot/Shape:output:0<transformer_block/sequential/dense_1/Tensordot/free:output:0Etransformer_block/sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:А
>transformer_block/sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ”
9transformer_block/sequential/dense_1/Tensordot/GatherV2_1GatherV2=transformer_block/sequential/dense_1/Tensordot/Shape:output:0<transformer_block/sequential/dense_1/Tensordot/axes:output:0Gtransformer_block/sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:~
4transformer_block/sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: Ё
3transformer_block/sequential/dense_1/Tensordot/ProdProd@transformer_block/sequential/dense_1/Tensordot/GatherV2:output:0=transformer_block/sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: А
6transformer_block/sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: г
5transformer_block/sequential/dense_1/Tensordot/Prod_1ProdBtransformer_block/sequential/dense_1/Tensordot/GatherV2_1:output:0?transformer_block/sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: |
:transformer_block/sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ∞
5transformer_block/sequential/dense_1/Tensordot/concatConcatV2<transformer_block/sequential/dense_1/Tensordot/free:output:0<transformer_block/sequential/dense_1/Tensordot/axes:output:0Ctransformer_block/sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:и
4transformer_block/sequential/dense_1/Tensordot/stackPack<transformer_block/sequential/dense_1/Tensordot/Prod:output:0>transformer_block/sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:у
8transformer_block/sequential/dense_1/Tensordot/transpose	Transpose5transformer_block/sequential/dense/Relu:activations:0>transformer_block/sequential/dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» щ
6transformer_block/sequential/dense_1/Tensordot/ReshapeReshape<transformer_block/sequential/dense_1/Tensordot/transpose:y:0=transformer_block/sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€щ
5transformer_block/sequential/dense_1/Tensordot/MatMulMatMul?transformer_block/sequential/dense_1/Tensordot/Reshape:output:0Etransformer_block/sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ А
6transformer_block/sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: ~
<transformer_block/sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ї
7transformer_block/sequential/dense_1/Tensordot/concat_1ConcatV2@transformer_block/sequential/dense_1/Tensordot/GatherV2:output:0?transformer_block/sequential/dense_1/Tensordot/Const_2:output:0Etransformer_block/sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:у
.transformer_block/sequential/dense_1/TensordotReshape?transformer_block/sequential/dense_1/Tensordot/MatMul:product:0@transformer_block/sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Љ
;transformer_block/sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOpDtransformer_block_sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0м
,transformer_block/sequential/dense_1/BiasAddBiasAdd7transformer_block/sequential/dense_1/Tensordot:output:0Ctransformer_block/sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» n
)transformer_block/dropout_1/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *д8О?–
'transformer_block/dropout_1/dropout/MulMul5transformer_block/sequential/dense_1/BiasAdd:output:02transformer_block/dropout_1/dropout/Const:output:0*
T0*,
_output_shapes
:€€€€€€€€€» О
)transformer_block/dropout_1/dropout/ShapeShape5transformer_block/sequential/dense_1/BiasAdd:output:0*
T0*
_output_shapes
:…
@transformer_block/dropout_1/dropout/random_uniform/RandomUniformRandomUniform2transformer_block/dropout_1/dropout/Shape:output:0*
T0*,
_output_shapes
:€€€€€€€€€» *
dtype0w
2transformer_block/dropout_1/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ќћћ=€
0transformer_block/dropout_1/dropout/GreaterEqualGreaterEqualItransformer_block/dropout_1/dropout/random_uniform/RandomUniform:output:0;transformer_block/dropout_1/dropout/GreaterEqual/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€» p
+transformer_block/dropout_1/dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    И
,transformer_block/dropout_1/dropout/SelectV2SelectV24transformer_block/dropout_1/dropout/GreaterEqual:z:0+transformer_block/dropout_1/dropout/Mul:z:04transformer_block/dropout_1/dropout/Const_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» …
transformer_block/add_1AddV29transformer_block/layer_normalization/batchnorm/add_1:z:05transformer_block/dropout_1/dropout/SelectV2:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Р
Ftransformer_block/layer_normalization_1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:т
4transformer_block/layer_normalization_1/moments/meanMeantransformer_block/add_1:z:0Otransformer_block/layer_normalization_1/moments/mean/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(¬
<transformer_block/layer_normalization_1/moments/StopGradientStopGradient=transformer_block/layer_normalization_1/moments/mean:output:0*
T0*,
_output_shapes
:€€€€€€€€€»с
Atransformer_block/layer_normalization_1/moments/SquaredDifferenceSquaredDifferencetransformer_block/add_1:z:0Etransformer_block/layer_normalization_1/moments/StopGradient:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ф
Jtransformer_block/layer_normalization_1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:§
8transformer_block/layer_normalization_1/moments/varianceMeanEtransformer_block/layer_normalization_1/moments/SquaredDifference:z:0Stransformer_block/layer_normalization_1/moments/variance/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(|
7transformer_block/layer_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *љ7Ж5ъ
5transformer_block/layer_normalization_1/batchnorm/addAddV2Atransformer_block/layer_normalization_1/moments/variance:output:0@transformer_block/layer_normalization_1/batchnorm/add/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€»≤
7transformer_block/layer_normalization_1/batchnorm/RsqrtRsqrt9transformer_block/layer_normalization_1/batchnorm/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€»ќ
Dtransformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOpMtransformer_block_layer_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0ю
5transformer_block/layer_normalization_1/batchnorm/mulMul;transformer_block/layer_normalization_1/batchnorm/Rsqrt:y:0Ltransformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» Ќ
7transformer_block/layer_normalization_1/batchnorm/mul_1Multransformer_block/add_1:z:09transformer_block/layer_normalization_1/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» п
7transformer_block/layer_normalization_1/batchnorm/mul_2Mul=transformer_block/layer_normalization_1/moments/mean:output:09transformer_block/layer_normalization_1/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ∆
@transformer_block/layer_normalization_1/batchnorm/ReadVariableOpReadVariableOpItransformer_block_layer_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0ъ
5transformer_block/layer_normalization_1/batchnorm/subSubHtransformer_block/layer_normalization_1/batchnorm/ReadVariableOp:value:0;transformer_block/layer_normalization_1/batchnorm/mul_2:z:0*
T0*,
_output_shapes
:€€€€€€€€€» п
7transformer_block/layer_normalization_1/batchnorm/add_1AddV2;transformer_block/layer_normalization_1/batchnorm/mul_1:z:09transformer_block/layer_normalization_1/batchnorm/sub:z:0*
T0*,
_output_shapes
:€€€€€€€€€» q
/global_average_pooling1d/Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :ќ
global_average_pooling1d/MeanMean;transformer_block/layer_normalization_1/batchnorm/add_1:z:08global_average_pooling1d/Mean/reduction_indices:output:0*
T0*'
_output_shapes
:€€€€€€€€€ \
dropout_2/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *д8О?Ш
dropout_2/dropout/MulMul&global_average_pooling1d/Mean:output:0 dropout_2/dropout/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€ m
dropout_2/dropout/ShapeShape&global_average_pooling1d/Mean:output:0*
T0*
_output_shapes
:†
.dropout_2/dropout/random_uniform/RandomUniformRandomUniform dropout_2/dropout/Shape:output:0*
T0*'
_output_shapes
:€€€€€€€€€ *
dtype0e
 dropout_2/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ќћћ=ƒ
dropout_2/dropout/GreaterEqualGreaterEqual7dropout_2/dropout/random_uniform/RandomUniform:output:0)dropout_2/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€ ^
dropout_2/dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    ї
dropout_2/dropout/SelectV2SelectV2"dropout_2/dropout/GreaterEqual:z:0dropout_2/dropout/Mul:z:0"dropout_2/dropout/Const_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€ Д
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource*
_output_shapes

: *
dtype0Ц
dense_2/MatMulMatMul#dropout_2/dropout/SelectV2:output:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€В
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0О
dense_2/BiasAddBiasAdddense_2/MatMul:product:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€`
dense_2/ReluReludense_2/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€\
dropout_3/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *д8О?М
dropout_3/dropout/MulMuldense_2/Relu:activations:0 dropout_3/dropout/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€a
dropout_3/dropout/ShapeShapedense_2/Relu:activations:0*
T0*
_output_shapes
:†
.dropout_3/dropout/random_uniform/RandomUniformRandomUniform dropout_3/dropout/Shape:output:0*
T0*'
_output_shapes
:€€€€€€€€€*
dtype0e
 dropout_3/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ќћћ=ƒ
dropout_3/dropout/GreaterEqualGreaterEqual7dropout_3/dropout/random_uniform/RandomUniform:output:0)dropout_3/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€^
dropout_3/dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    ї
dropout_3/dropout/SelectV2SelectV2"dropout_3/dropout/GreaterEqual:z:0dropout_3/dropout/Mul:z:0"dropout_3/dropout/Const_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€Д
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource*
_output_shapes

:*
dtype0Ц
dense_3/MatMulMatMul#dropout_3/dropout/SelectV2:output:0%dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€В
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0О
dense_3/BiasAddBiasAdddense_3/MatMul:product:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€f
dense_3/SoftmaxSoftmaxdense_3/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€h
IdentityIdentitydense_3/Softmax:softmax:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€Р
NoOpNoOp^dense_2/BiasAdd/ReadVariableOp^dense_2/MatMul/ReadVariableOp^dense_3/BiasAdd/ReadVariableOp^dense_3/MatMul/ReadVariableOp8^token_and_position_embedding/embedding/embedding_lookup:^token_and_position_embedding/embedding_1/embedding_lookup?^transformer_block/layer_normalization/batchnorm/ReadVariableOpC^transformer_block/layer_normalization/batchnorm/mul/ReadVariableOpA^transformer_block/layer_normalization_1/batchnorm/ReadVariableOpE^transformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOpK^transformer_block/multi_head_attention/attention_output/add/ReadVariableOpU^transformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp>^transformer_block/multi_head_attention/key/add/ReadVariableOpH^transformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOp@^transformer_block/multi_head_attention/query/add/ReadVariableOpJ^transformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOp@^transformer_block/multi_head_attention/value/add/ReadVariableOpJ^transformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOp:^transformer_block/sequential/dense/BiasAdd/ReadVariableOp<^transformer_block/sequential/dense/Tensordot/ReadVariableOp<^transformer_block/sequential/dense_1/BiasAdd/ReadVariableOp>^transformer_block/sequential/dense_1/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:€€€€€€€€€»: : : : : : : : : : : : : : : : : : : : : : 2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp2r
7token_and_position_embedding/embedding/embedding_lookup7token_and_position_embedding/embedding/embedding_lookup2v
9token_and_position_embedding/embedding_1/embedding_lookup9token_and_position_embedding/embedding_1/embedding_lookup2А
>transformer_block/layer_normalization/batchnorm/ReadVariableOp>transformer_block/layer_normalization/batchnorm/ReadVariableOp2И
Btransformer_block/layer_normalization/batchnorm/mul/ReadVariableOpBtransformer_block/layer_normalization/batchnorm/mul/ReadVariableOp2Д
@transformer_block/layer_normalization_1/batchnorm/ReadVariableOp@transformer_block/layer_normalization_1/batchnorm/ReadVariableOp2М
Dtransformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOpDtransformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOp2Ш
Jtransformer_block/multi_head_attention/attention_output/add/ReadVariableOpJtransformer_block/multi_head_attention/attention_output/add/ReadVariableOp2ђ
Ttransformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpTtransformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp2~
=transformer_block/multi_head_attention/key/add/ReadVariableOp=transformer_block/multi_head_attention/key/add/ReadVariableOp2Т
Gtransformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOpGtransformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOp2В
?transformer_block/multi_head_attention/query/add/ReadVariableOp?transformer_block/multi_head_attention/query/add/ReadVariableOp2Ц
Itransformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOpItransformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOp2В
?transformer_block/multi_head_attention/value/add/ReadVariableOp?transformer_block/multi_head_attention/value/add/ReadVariableOp2Ц
Itransformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOpItransformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOp2v
9transformer_block/sequential/dense/BiasAdd/ReadVariableOp9transformer_block/sequential/dense/BiasAdd/ReadVariableOp2z
;transformer_block/sequential/dense/Tensordot/ReadVariableOp;transformer_block/sequential/dense/Tensordot/ReadVariableOp2z
;transformer_block/sequential/dense_1/BiasAdd/ReadVariableOp;transformer_block/sequential/dense_1/BiasAdd/ReadVariableOp2~
=transformer_block/sequential/dense_1/Tensordot/ReadVariableOp=transformer_block/sequential/dense_1/Tensordot/ReadVariableOp:P L
(
_output_shapes
:€€€€€€€€€»
 
_user_specified_nameinputs
Ј
N
"__inference__update_step_xla_18060
gradient
variable: *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes
: : *
	_noinline(:H D

_output_shapes

: 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Ђ
J
"__inference__update_step_xla_18140
gradient
variable:*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

:: *
	_noinline(:D @

_output_shapes
:
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Ј
N
"__inference__update_step_xla_18070
gradient
variable: *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes
: : *
	_noinline(:H D

_output_shapes

: 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
√
R
"__inference__update_step_xla_18055
gradient
variable:  *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*#
_input_shapes
:  : *
	_noinline(:L H
"
_output_shapes
:  
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
”
±
1__inference_transformer_block_layer_call_fn_18246

inputs
unknown:  
	unknown_0: 
	unknown_1:  
	unknown_2: 
	unknown_3:  
	unknown_4: 
	unknown_5:  
	unknown_6: 
	unknown_7: 
	unknown_8: 
	unknown_9:  

unknown_10: 

unknown_11:  

unknown_12: 

unknown_13: 

unknown_14: 
identityИҐStatefulPartitionedCall§
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *2
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *U
fPRN
L__inference_transformer_block_layer_call_and_return_conditional_losses_17162t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8:€€€€€€€€€» : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
Ъµ
г
L__inference_transformer_block_layer_call_and_return_conditional_losses_16784

inputsV
@multi_head_attention_query_einsum_einsum_readvariableop_resource:  H
6multi_head_attention_query_add_readvariableop_resource: T
>multi_head_attention_key_einsum_einsum_readvariableop_resource:  F
4multi_head_attention_key_add_readvariableop_resource: V
@multi_head_attention_value_einsum_einsum_readvariableop_resource:  H
6multi_head_attention_value_add_readvariableop_resource: a
Kmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource:  O
Amulti_head_attention_attention_output_add_readvariableop_resource: G
9layer_normalization_batchnorm_mul_readvariableop_resource: C
5layer_normalization_batchnorm_readvariableop_resource: D
2sequential_dense_tensordot_readvariableop_resource:  >
0sequential_dense_biasadd_readvariableop_resource: F
4sequential_dense_1_tensordot_readvariableop_resource:  @
2sequential_dense_1_biasadd_readvariableop_resource: I
;layer_normalization_1_batchnorm_mul_readvariableop_resource: E
7layer_normalization_1_batchnorm_readvariableop_resource: 
identityИҐ,layer_normalization/batchnorm/ReadVariableOpҐ0layer_normalization/batchnorm/mul/ReadVariableOpҐ.layer_normalization_1/batchnorm/ReadVariableOpҐ2layer_normalization_1/batchnorm/mul/ReadVariableOpҐ8multi_head_attention/attention_output/add/ReadVariableOpҐBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpҐ+multi_head_attention/key/add/ReadVariableOpҐ5multi_head_attention/key/einsum/Einsum/ReadVariableOpҐ-multi_head_attention/query/add/ReadVariableOpҐ7multi_head_attention/query/einsum/Einsum/ReadVariableOpҐ-multi_head_attention/value/add/ReadVariableOpҐ7multi_head_attention/value/einsum/Einsum/ReadVariableOpҐ'sequential/dense/BiasAdd/ReadVariableOpҐ)sequential/dense/Tensordot/ReadVariableOpҐ)sequential/dense_1/BiasAdd/ReadVariableOpҐ+sequential/dense_1/Tensordot/ReadVariableOpЉ
7multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0№
(multi_head_attention/query/einsum/EinsumEinsuminputs?multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde§
-multi_head_attention/query/add/ReadVariableOpReadVariableOp6multi_head_attention_query_add_readvariableop_resource*
_output_shapes

: *
dtype0ћ
multi_head_attention/query/addAddV21multi_head_attention/query/einsum/Einsum:output:05multi_head_attention/query/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» Є
5multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOp>multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Ў
&multi_head_attention/key/einsum/EinsumEinsuminputs=multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde†
+multi_head_attention/key/add/ReadVariableOpReadVariableOp4multi_head_attention_key_add_readvariableop_resource*
_output_shapes

: *
dtype0∆
multi_head_attention/key/addAddV2/multi_head_attention/key/einsum/Einsum:output:03multi_head_attention/key/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» Љ
7multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0№
(multi_head_attention/value/einsum/EinsumEinsuminputs?multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde§
-multi_head_attention/value/add/ReadVariableOpReadVariableOp6multi_head_attention_value_add_readvariableop_resource*
_output_shapes

: *
dtype0ћ
multi_head_attention/value/addAddV21multi_head_attention/value/einsum/Einsum:output:05multi_head_attention/value/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» _
multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *у5>£
multi_head_attention/MulMul"multi_head_attention/query/add:z:0#multi_head_attention/Mul/y:output:0*
T0*0
_output_shapes
:€€€€€€€€€» –
"multi_head_attention/einsum/EinsumEinsum multi_head_attention/key/add:z:0multi_head_attention/Mul:z:0*
N*
T0*1
_output_shapes
:€€€€€€€€€»»*
equationaecd,abcd->acbeШ
$multi_head_attention/softmax/SoftmaxSoftmax+multi_head_attention/einsum/Einsum:output:0*
T0*1
_output_shapes
:€€€€€€€€€»»Э
%multi_head_attention/dropout/IdentityIdentity.multi_head_attention/softmax/Softmax:softmax:0*
T0*1
_output_shapes
:€€€€€€€€€»»е
$multi_head_attention/einsum_1/EinsumEinsum.multi_head_attention/dropout/Identity:output:0"multi_head_attention/value/add:z:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationacbe,aecd->abcd“
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpKmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Х
3multi_head_attention/attention_output/einsum/EinsumEinsum-multi_head_attention/einsum_1/Einsum:output:0Jmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*,
_output_shapes
:€€€€€€€€€» *
equationabcd,cde->abeґ
8multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpAmulti_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
: *
dtype0й
)multi_head_attention/attention_output/addAddV2<multi_head_attention/attention_output/einsum/Einsum:output:0@multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» В
dropout/IdentityIdentity-multi_head_attention/attention_output/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€» f
addAddV2inputsdropout/Identity:output:0*
T0*,
_output_shapes
:€€€€€€€€€» |
2layer_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:ґ
 layer_normalization/moments/meanMeanadd:z:0;layer_normalization/moments/mean/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(Ъ
(layer_normalization/moments/StopGradientStopGradient)layer_normalization/moments/mean:output:0*
T0*,
_output_shapes
:€€€€€€€€€»µ
-layer_normalization/moments/SquaredDifferenceSquaredDifferenceadd:z:01layer_normalization/moments/StopGradient:output:0*
T0*,
_output_shapes
:€€€€€€€€€» А
6layer_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:и
$layer_normalization/moments/varianceMean1layer_normalization/moments/SquaredDifference:z:0?layer_normalization/moments/variance/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(h
#layer_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *љ7Ж5Њ
!layer_normalization/batchnorm/addAddV2-layer_normalization/moments/variance:output:0,layer_normalization/batchnorm/add/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€»К
#layer_normalization/batchnorm/RsqrtRsqrt%layer_normalization/batchnorm/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€»¶
0layer_normalization/batchnorm/mul/ReadVariableOpReadVariableOp9layer_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0¬
!layer_normalization/batchnorm/mulMul'layer_normalization/batchnorm/Rsqrt:y:08layer_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» С
#layer_normalization/batchnorm/mul_1Muladd:z:0%layer_normalization/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ≥
#layer_normalization/batchnorm/mul_2Mul)layer_normalization/moments/mean:output:0%layer_normalization/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» Ю
,layer_normalization/batchnorm/ReadVariableOpReadVariableOp5layer_normalization_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0Њ
!layer_normalization/batchnorm/subSub4layer_normalization/batchnorm/ReadVariableOp:value:0'layer_normalization/batchnorm/mul_2:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ≥
#layer_normalization/batchnorm/add_1AddV2'layer_normalization/batchnorm/mul_1:z:0%layer_normalization/batchnorm/sub:z:0*
T0*,
_output_shapes
:€€€€€€€€€» Ь
)sequential/dense/Tensordot/ReadVariableOpReadVariableOp2sequential_dense_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0i
sequential/dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:p
sequential/dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       w
 sequential/dense/Tensordot/ShapeShape'layer_normalization/batchnorm/add_1:z:0*
T0*
_output_shapes
:j
(sequential/dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : €
#sequential/dense/Tensordot/GatherV2GatherV2)sequential/dense/Tensordot/Shape:output:0(sequential/dense/Tensordot/free:output:01sequential/dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
*sequential/dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Г
%sequential/dense/Tensordot/GatherV2_1GatherV2)sequential/dense/Tensordot/Shape:output:0(sequential/dense/Tensordot/axes:output:03sequential/dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:j
 sequential/dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: °
sequential/dense/Tensordot/ProdProd,sequential/dense/Tensordot/GatherV2:output:0)sequential/dense/Tensordot/Const:output:0*
T0*
_output_shapes
: l
"sequential/dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: І
!sequential/dense/Tensordot/Prod_1Prod.sequential/dense/Tensordot/GatherV2_1:output:0+sequential/dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: h
&sequential/dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : а
!sequential/dense/Tensordot/concatConcatV2(sequential/dense/Tensordot/free:output:0(sequential/dense/Tensordot/axes:output:0/sequential/dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:ђ
 sequential/dense/Tensordot/stackPack(sequential/dense/Tensordot/Prod:output:0*sequential/dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:љ
$sequential/dense/Tensordot/transpose	Transpose'layer_normalization/batchnorm/add_1:z:0*sequential/dense/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» љ
"sequential/dense/Tensordot/ReshapeReshape(sequential/dense/Tensordot/transpose:y:0)sequential/dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€љ
!sequential/dense/Tensordot/MatMulMatMul+sequential/dense/Tensordot/Reshape:output:01sequential/dense/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ l
"sequential/dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: j
(sequential/dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : л
#sequential/dense/Tensordot/concat_1ConcatV2,sequential/dense/Tensordot/GatherV2:output:0+sequential/dense/Tensordot/Const_2:output:01sequential/dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Ј
sequential/dense/TensordotReshape+sequential/dense/Tensordot/MatMul:product:0,sequential/dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ф
'sequential/dense/BiasAdd/ReadVariableOpReadVariableOp0sequential_dense_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0∞
sequential/dense/BiasAddBiasAdd#sequential/dense/Tensordot:output:0/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» w
sequential/dense/ReluRelu!sequential/dense/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€» †
+sequential/dense_1/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0k
!sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:r
!sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       u
"sequential/dense_1/Tensordot/ShapeShape#sequential/dense/Relu:activations:0*
T0*
_output_shapes
:l
*sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : З
%sequential/dense_1/Tensordot/GatherV2GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/free:output:03sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
,sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Л
'sequential/dense_1/Tensordot/GatherV2_1GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/axes:output:05sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
"sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: І
!sequential/dense_1/Tensordot/ProdProd.sequential/dense_1/Tensordot/GatherV2:output:0+sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≠
#sequential/dense_1/Tensordot/Prod_1Prod0sequential/dense_1/Tensordot/GatherV2_1:output:0-sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : и
#sequential/dense_1/Tensordot/concatConcatV2*sequential/dense_1/Tensordot/free:output:0*sequential/dense_1/Tensordot/axes:output:01sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:≤
"sequential/dense_1/Tensordot/stackPack*sequential/dense_1/Tensordot/Prod:output:0,sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:љ
&sequential/dense_1/Tensordot/transpose	Transpose#sequential/dense/Relu:activations:0,sequential/dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» √
$sequential/dense_1/Tensordot/ReshapeReshape*sequential/dense_1/Tensordot/transpose:y:0+sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€√
#sequential/dense_1/Tensordot/MatMulMatMul-sequential/dense_1/Tensordot/Reshape:output:03sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ n
$sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: l
*sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : у
%sequential/dense_1/Tensordot/concat_1ConcatV2.sequential/dense_1/Tensordot/GatherV2:output:0-sequential/dense_1/Tensordot/Const_2:output:03sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:љ
sequential/dense_1/TensordotReshape-sequential/dense_1/Tensordot/MatMul:product:0.sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ш
)sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0ґ
sequential/dense_1/BiasAddBiasAdd%sequential/dense_1/Tensordot:output:01sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» z
dropout_1/IdentityIdentity#sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Л
add_1AddV2'layer_normalization/batchnorm/add_1:z:0dropout_1/Identity:output:0*
T0*,
_output_shapes
:€€€€€€€€€» ~
4layer_normalization_1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:Љ
"layer_normalization_1/moments/meanMean	add_1:z:0=layer_normalization_1/moments/mean/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(Ю
*layer_normalization_1/moments/StopGradientStopGradient+layer_normalization_1/moments/mean:output:0*
T0*,
_output_shapes
:€€€€€€€€€»ї
/layer_normalization_1/moments/SquaredDifferenceSquaredDifference	add_1:z:03layer_normalization_1/moments/StopGradient:output:0*
T0*,
_output_shapes
:€€€€€€€€€» В
8layer_normalization_1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:о
&layer_normalization_1/moments/varianceMean3layer_normalization_1/moments/SquaredDifference:z:0Alayer_normalization_1/moments/variance/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(j
%layer_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *љ7Ж5ƒ
#layer_normalization_1/batchnorm/addAddV2/layer_normalization_1/moments/variance:output:0.layer_normalization_1/batchnorm/add/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€»О
%layer_normalization_1/batchnorm/RsqrtRsqrt'layer_normalization_1/batchnorm/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€»™
2layer_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOp;layer_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0»
#layer_normalization_1/batchnorm/mulMul)layer_normalization_1/batchnorm/Rsqrt:y:0:layer_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» Ч
%layer_normalization_1/batchnorm/mul_1Mul	add_1:z:0'layer_normalization_1/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» є
%layer_normalization_1/batchnorm/mul_2Mul+layer_normalization_1/moments/mean:output:0'layer_normalization_1/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» Ґ
.layer_normalization_1/batchnorm/ReadVariableOpReadVariableOp7layer_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0ƒ
#layer_normalization_1/batchnorm/subSub6layer_normalization_1/batchnorm/ReadVariableOp:value:0)layer_normalization_1/batchnorm/mul_2:z:0*
T0*,
_output_shapes
:€€€€€€€€€» є
%layer_normalization_1/batchnorm/add_1AddV2)layer_normalization_1/batchnorm/mul_1:z:0'layer_normalization_1/batchnorm/sub:z:0*
T0*,
_output_shapes
:€€€€€€€€€» }
IdentityIdentity)layer_normalization_1/batchnorm/add_1:z:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» ш
NoOpNoOp-^layer_normalization/batchnorm/ReadVariableOp1^layer_normalization/batchnorm/mul/ReadVariableOp/^layer_normalization_1/batchnorm/ReadVariableOp3^layer_normalization_1/batchnorm/mul/ReadVariableOp9^multi_head_attention/attention_output/add/ReadVariableOpC^multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp,^multi_head_attention/key/add/ReadVariableOp6^multi_head_attention/key/einsum/Einsum/ReadVariableOp.^multi_head_attention/query/add/ReadVariableOp8^multi_head_attention/query/einsum/Einsum/ReadVariableOp.^multi_head_attention/value/add/ReadVariableOp8^multi_head_attention/value/einsum/Einsum/ReadVariableOp(^sequential/dense/BiasAdd/ReadVariableOp*^sequential/dense/Tensordot/ReadVariableOp*^sequential/dense_1/BiasAdd/ReadVariableOp,^sequential/dense_1/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8:€€€€€€€€€» : : : : : : : : : : : : : : : : 2\
,layer_normalization/batchnorm/ReadVariableOp,layer_normalization/batchnorm/ReadVariableOp2d
0layer_normalization/batchnorm/mul/ReadVariableOp0layer_normalization/batchnorm/mul/ReadVariableOp2`
.layer_normalization_1/batchnorm/ReadVariableOp.layer_normalization_1/batchnorm/ReadVariableOp2h
2layer_normalization_1/batchnorm/mul/ReadVariableOp2layer_normalization_1/batchnorm/mul/ReadVariableOp2t
8multi_head_attention/attention_output/add/ReadVariableOp8multi_head_attention/attention_output/add/ReadVariableOp2И
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp2Z
+multi_head_attention/key/add/ReadVariableOp+multi_head_attention/key/add/ReadVariableOp2n
5multi_head_attention/key/einsum/Einsum/ReadVariableOp5multi_head_attention/key/einsum/Einsum/ReadVariableOp2^
-multi_head_attention/query/add/ReadVariableOp-multi_head_attention/query/add/ReadVariableOp2r
7multi_head_attention/query/einsum/Einsum/ReadVariableOp7multi_head_attention/query/einsum/Einsum/ReadVariableOp2^
-multi_head_attention/value/add/ReadVariableOp-multi_head_attention/value/add/ReadVariableOp2r
7multi_head_attention/value/einsum/Einsum/ReadVariableOp7multi_head_attention/value/einsum/Einsum/ReadVariableOp2R
'sequential/dense/BiasAdd/ReadVariableOp'sequential/dense/BiasAdd/ReadVariableOp2V
)sequential/dense/Tensordot/ReadVariableOp)sequential/dense/Tensordot/ReadVariableOp2V
)sequential/dense_1/BiasAdd/ReadVariableOp)sequential/dense_1/BiasAdd/ReadVariableOp2Z
+sequential/dense_1/Tensordot/ReadVariableOp+sequential/dense_1/Tensordot/ReadVariableOp:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
„
b
D__inference_dropout_2_layer_call_and_return_conditional_losses_16824

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:€€€€€€€€€ [

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:€€€€€€€€€ "!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€ :O K
'
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
ф
o
"__inference__update_step_xla_18040
gradient

gradient_1

gradient_2
variable:	» *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*-
_input_shapes
:	» :»:: *
	_noinline(:I E

_output_shapes
:	» 
"
_user_specified_name
gradient:EA

_output_shapes	
:»
"
_user_specified_name
gradient:D@

_output_shapes
:
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Ѕ
Ф
'__inference_dense_2_layer_call_fn_18561

inputs
unknown: 
	unknown_0:
identityИҐStatefulPartitionedCallЏ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_16837o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€ : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
Щ

у
B__inference_dense_2_layer_call_and_return_conditional_losses_18572

inputs0
matmul_readvariableop_resource: -
biasadd_readvariableop_resource:
identityИҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: *
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€ : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
э
Ъ
W__inference_token_and_position_embedding_layer_call_and_return_conditional_losses_18172
x5
"embedding_1_embedding_lookup_18160:	» 4
 embedding_embedding_lookup_18165:
†Ь 
identityИҐembedding/embedding_lookupҐembedding_1/embedding_lookup6
ShapeShapex*
T0*
_output_shapes
:f
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
€€€€€€€€€_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:—
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskM
range/startConst*
_output_shapes
: *
dtype0*
value	B : M
range/deltaConst*
_output_shapes
: *
dtype0*
value	B :o
rangeRangerange/start:output:0strided_slice:output:0range/delta:output:0*
_output_shapes	
:»„
embedding_1/embedding_lookupResourceGather"embedding_1_embedding_lookup_18160range:output:0*
Tindices0*5
_class+
)'loc:@embedding_1/embedding_lookup/18160*
_output_shapes
:	» *
dtype0є
%embedding_1/embedding_lookup/IdentityIdentity%embedding_1/embedding_lookup:output:0*
T0*5
_class+
)'loc:@embedding_1/embedding_lookup/18160*
_output_shapes
:	» Н
'embedding_1/embedding_lookup/Identity_1Identity.embedding_1/embedding_lookup/Identity:output:0*
T0*
_output_shapes
:	» —
embedding/embedding_lookupResourceGather embedding_embedding_lookup_18165x*
Tindices0*3
_class)
'%loc:@embedding/embedding_lookup/18165*,
_output_shapes
:€€€€€€€€€» *
dtype0ј
#embedding/embedding_lookup/IdentityIdentity#embedding/embedding_lookup:output:0*
T0*3
_class)
'%loc:@embedding/embedding_lookup/18165*,
_output_shapes
:€€€€€€€€€» Ц
%embedding/embedding_lookup/Identity_1Identity,embedding/embedding_lookup/Identity:output:0*
T0*,
_output_shapes
:€€€€€€€€€» •
addAddV2.embedding/embedding_lookup/Identity_1:output:00embedding_1/embedding_lookup/Identity_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» [
IdentityIdentityadd:z:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» В
NoOpNoOp^embedding/embedding_lookup^embedding_1/embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:€€€€€€€€€»: : 28
embedding/embedding_lookupembedding/embedding_lookup2<
embedding_1/embedding_lookupembedding_1/embedding_lookup:K G
(
_output_shapes
:€€€€€€€€€»

_user_specified_namex
„
b
D__inference_dropout_3_layer_call_and_return_conditional_losses_18587

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:€€€€€€€€€[

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:€€€€€€€€€"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
т
b
)__inference_dropout_3_layer_call_fn_18582

inputs
identityИҐStatefulPartitionedCall¬
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_16945o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Ђ
J
"__inference__update_step_xla_18090
gradient
variable: *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

: : *
	_noinline(:D @

_output_shapes
: 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
ь
T
8__inference_global_average_pooling1d_layer_call_fn_18519

inputs
identity 
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€€€€€€€€€€* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *\
fWRU
S__inference_global_average_pooling1d_layer_call_and_return_conditional_losses_16618i
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):'€€€€€€€€€€€€€€€€€€€€€€€€€€€:e a
=
_output_shapes+
):'€€€€€€€€€€€€€€€€€€€€€€€€€€€
 
_user_specified_nameinputs
”
±
1__inference_transformer_block_layer_call_fn_18209

inputs
unknown:  
	unknown_0: 
	unknown_1:  
	unknown_2: 
	unknown_3:  
	unknown_4: 
	unknown_5:  
	unknown_6: 
	unknown_7: 
	unknown_8: 
	unknown_9:  

unknown_10: 

unknown_11:  

unknown_12: 

unknown_13: 

unknown_14: 
identityИҐStatefulPartitionedCall§
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *2
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *U
fPRN
L__inference_transformer_block_layer_call_and_return_conditional_losses_16784t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8:€€€€€€€€€» : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
К

c
D__inference_dropout_3_layer_call_and_return_conditional_losses_18599

inputs
identityИR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *д8О?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:М
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:€€€€€€€€€*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ќћћ=¶
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€T
dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    У
dropout/SelectV2SelectV2dropout/GreaterEqual:z:0dropout/Mul:z:0dropout/Const_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€a
IdentityIdentitydropout/SelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
йƒ
г
L__inference_transformer_block_layer_call_and_return_conditional_losses_17162

inputsV
@multi_head_attention_query_einsum_einsum_readvariableop_resource:  H
6multi_head_attention_query_add_readvariableop_resource: T
>multi_head_attention_key_einsum_einsum_readvariableop_resource:  F
4multi_head_attention_key_add_readvariableop_resource: V
@multi_head_attention_value_einsum_einsum_readvariableop_resource:  H
6multi_head_attention_value_add_readvariableop_resource: a
Kmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource:  O
Amulti_head_attention_attention_output_add_readvariableop_resource: G
9layer_normalization_batchnorm_mul_readvariableop_resource: C
5layer_normalization_batchnorm_readvariableop_resource: D
2sequential_dense_tensordot_readvariableop_resource:  >
0sequential_dense_biasadd_readvariableop_resource: F
4sequential_dense_1_tensordot_readvariableop_resource:  @
2sequential_dense_1_biasadd_readvariableop_resource: I
;layer_normalization_1_batchnorm_mul_readvariableop_resource: E
7layer_normalization_1_batchnorm_readvariableop_resource: 
identityИҐ,layer_normalization/batchnorm/ReadVariableOpҐ0layer_normalization/batchnorm/mul/ReadVariableOpҐ.layer_normalization_1/batchnorm/ReadVariableOpҐ2layer_normalization_1/batchnorm/mul/ReadVariableOpҐ8multi_head_attention/attention_output/add/ReadVariableOpҐBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpҐ+multi_head_attention/key/add/ReadVariableOpҐ5multi_head_attention/key/einsum/Einsum/ReadVariableOpҐ-multi_head_attention/query/add/ReadVariableOpҐ7multi_head_attention/query/einsum/Einsum/ReadVariableOpҐ-multi_head_attention/value/add/ReadVariableOpҐ7multi_head_attention/value/einsum/Einsum/ReadVariableOpҐ'sequential/dense/BiasAdd/ReadVariableOpҐ)sequential/dense/Tensordot/ReadVariableOpҐ)sequential/dense_1/BiasAdd/ReadVariableOpҐ+sequential/dense_1/Tensordot/ReadVariableOpЉ
7multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0№
(multi_head_attention/query/einsum/EinsumEinsuminputs?multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde§
-multi_head_attention/query/add/ReadVariableOpReadVariableOp6multi_head_attention_query_add_readvariableop_resource*
_output_shapes

: *
dtype0ћ
multi_head_attention/query/addAddV21multi_head_attention/query/einsum/Einsum:output:05multi_head_attention/query/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» Є
5multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOp>multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Ў
&multi_head_attention/key/einsum/EinsumEinsuminputs=multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde†
+multi_head_attention/key/add/ReadVariableOpReadVariableOp4multi_head_attention_key_add_readvariableop_resource*
_output_shapes

: *
dtype0∆
multi_head_attention/key/addAddV2/multi_head_attention/key/einsum/Einsum:output:03multi_head_attention/key/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» Љ
7multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0№
(multi_head_attention/value/einsum/EinsumEinsuminputs?multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde§
-multi_head_attention/value/add/ReadVariableOpReadVariableOp6multi_head_attention_value_add_readvariableop_resource*
_output_shapes

: *
dtype0ћ
multi_head_attention/value/addAddV21multi_head_attention/value/einsum/Einsum:output:05multi_head_attention/value/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» _
multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *у5>£
multi_head_attention/MulMul"multi_head_attention/query/add:z:0#multi_head_attention/Mul/y:output:0*
T0*0
_output_shapes
:€€€€€€€€€» –
"multi_head_attention/einsum/EinsumEinsum multi_head_attention/key/add:z:0multi_head_attention/Mul:z:0*
N*
T0*1
_output_shapes
:€€€€€€€€€»»*
equationaecd,abcd->acbeШ
$multi_head_attention/softmax/SoftmaxSoftmax+multi_head_attention/einsum/Einsum:output:0*
T0*1
_output_shapes
:€€€€€€€€€»»Э
%multi_head_attention/dropout/IdentityIdentity.multi_head_attention/softmax/Softmax:softmax:0*
T0*1
_output_shapes
:€€€€€€€€€»»е
$multi_head_attention/einsum_1/EinsumEinsum.multi_head_attention/dropout/Identity:output:0"multi_head_attention/value/add:z:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationacbe,aecd->abcd“
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpKmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Х
3multi_head_attention/attention_output/einsum/EinsumEinsum-multi_head_attention/einsum_1/Einsum:output:0Jmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*,
_output_shapes
:€€€€€€€€€» *
equationabcd,cde->abeґ
8multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpAmulti_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
: *
dtype0й
)multi_head_attention/attention_output/addAddV2<multi_head_attention/attention_output/einsum/Einsum:output:0@multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» Z
dropout/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *д8О?†
dropout/dropout/MulMul-multi_head_attention/attention_output/add:z:0dropout/dropout/Const:output:0*
T0*,
_output_shapes
:€€€€€€€€€» r
dropout/dropout/ShapeShape-multi_head_attention/attention_output/add:z:0*
T0*
_output_shapes
:°
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape:output:0*
T0*,
_output_shapes
:€€€€€€€€€» *
dtype0c
dropout/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ќћћ=√
dropout/dropout/GreaterEqualGreaterEqual5dropout/dropout/random_uniform/RandomUniform:output:0'dropout/dropout/GreaterEqual/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€» \
dropout/dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    Є
dropout/dropout/SelectV2SelectV2 dropout/dropout/GreaterEqual:z:0dropout/dropout/Mul:z:0 dropout/dropout/Const_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» n
addAddV2inputs!dropout/dropout/SelectV2:output:0*
T0*,
_output_shapes
:€€€€€€€€€» |
2layer_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:ґ
 layer_normalization/moments/meanMeanadd:z:0;layer_normalization/moments/mean/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(Ъ
(layer_normalization/moments/StopGradientStopGradient)layer_normalization/moments/mean:output:0*
T0*,
_output_shapes
:€€€€€€€€€»µ
-layer_normalization/moments/SquaredDifferenceSquaredDifferenceadd:z:01layer_normalization/moments/StopGradient:output:0*
T0*,
_output_shapes
:€€€€€€€€€» А
6layer_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:и
$layer_normalization/moments/varianceMean1layer_normalization/moments/SquaredDifference:z:0?layer_normalization/moments/variance/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(h
#layer_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *љ7Ж5Њ
!layer_normalization/batchnorm/addAddV2-layer_normalization/moments/variance:output:0,layer_normalization/batchnorm/add/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€»К
#layer_normalization/batchnorm/RsqrtRsqrt%layer_normalization/batchnorm/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€»¶
0layer_normalization/batchnorm/mul/ReadVariableOpReadVariableOp9layer_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0¬
!layer_normalization/batchnorm/mulMul'layer_normalization/batchnorm/Rsqrt:y:08layer_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» С
#layer_normalization/batchnorm/mul_1Muladd:z:0%layer_normalization/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ≥
#layer_normalization/batchnorm/mul_2Mul)layer_normalization/moments/mean:output:0%layer_normalization/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» Ю
,layer_normalization/batchnorm/ReadVariableOpReadVariableOp5layer_normalization_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0Њ
!layer_normalization/batchnorm/subSub4layer_normalization/batchnorm/ReadVariableOp:value:0'layer_normalization/batchnorm/mul_2:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ≥
#layer_normalization/batchnorm/add_1AddV2'layer_normalization/batchnorm/mul_1:z:0%layer_normalization/batchnorm/sub:z:0*
T0*,
_output_shapes
:€€€€€€€€€» Ь
)sequential/dense/Tensordot/ReadVariableOpReadVariableOp2sequential_dense_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0i
sequential/dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:p
sequential/dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       w
 sequential/dense/Tensordot/ShapeShape'layer_normalization/batchnorm/add_1:z:0*
T0*
_output_shapes
:j
(sequential/dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : €
#sequential/dense/Tensordot/GatherV2GatherV2)sequential/dense/Tensordot/Shape:output:0(sequential/dense/Tensordot/free:output:01sequential/dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
*sequential/dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Г
%sequential/dense/Tensordot/GatherV2_1GatherV2)sequential/dense/Tensordot/Shape:output:0(sequential/dense/Tensordot/axes:output:03sequential/dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:j
 sequential/dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: °
sequential/dense/Tensordot/ProdProd,sequential/dense/Tensordot/GatherV2:output:0)sequential/dense/Tensordot/Const:output:0*
T0*
_output_shapes
: l
"sequential/dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: І
!sequential/dense/Tensordot/Prod_1Prod.sequential/dense/Tensordot/GatherV2_1:output:0+sequential/dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: h
&sequential/dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : а
!sequential/dense/Tensordot/concatConcatV2(sequential/dense/Tensordot/free:output:0(sequential/dense/Tensordot/axes:output:0/sequential/dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:ђ
 sequential/dense/Tensordot/stackPack(sequential/dense/Tensordot/Prod:output:0*sequential/dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:љ
$sequential/dense/Tensordot/transpose	Transpose'layer_normalization/batchnorm/add_1:z:0*sequential/dense/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» љ
"sequential/dense/Tensordot/ReshapeReshape(sequential/dense/Tensordot/transpose:y:0)sequential/dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€љ
!sequential/dense/Tensordot/MatMulMatMul+sequential/dense/Tensordot/Reshape:output:01sequential/dense/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ l
"sequential/dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: j
(sequential/dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : л
#sequential/dense/Tensordot/concat_1ConcatV2,sequential/dense/Tensordot/GatherV2:output:0+sequential/dense/Tensordot/Const_2:output:01sequential/dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Ј
sequential/dense/TensordotReshape+sequential/dense/Tensordot/MatMul:product:0,sequential/dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ф
'sequential/dense/BiasAdd/ReadVariableOpReadVariableOp0sequential_dense_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0∞
sequential/dense/BiasAddBiasAdd#sequential/dense/Tensordot:output:0/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» w
sequential/dense/ReluRelu!sequential/dense/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€» †
+sequential/dense_1/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0k
!sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:r
!sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       u
"sequential/dense_1/Tensordot/ShapeShape#sequential/dense/Relu:activations:0*
T0*
_output_shapes
:l
*sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : З
%sequential/dense_1/Tensordot/GatherV2GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/free:output:03sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
,sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Л
'sequential/dense_1/Tensordot/GatherV2_1GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/axes:output:05sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
"sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: І
!sequential/dense_1/Tensordot/ProdProd.sequential/dense_1/Tensordot/GatherV2:output:0+sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≠
#sequential/dense_1/Tensordot/Prod_1Prod0sequential/dense_1/Tensordot/GatherV2_1:output:0-sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : и
#sequential/dense_1/Tensordot/concatConcatV2*sequential/dense_1/Tensordot/free:output:0*sequential/dense_1/Tensordot/axes:output:01sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:≤
"sequential/dense_1/Tensordot/stackPack*sequential/dense_1/Tensordot/Prod:output:0,sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:љ
&sequential/dense_1/Tensordot/transpose	Transpose#sequential/dense/Relu:activations:0,sequential/dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» √
$sequential/dense_1/Tensordot/ReshapeReshape*sequential/dense_1/Tensordot/transpose:y:0+sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€√
#sequential/dense_1/Tensordot/MatMulMatMul-sequential/dense_1/Tensordot/Reshape:output:03sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ n
$sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: l
*sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : у
%sequential/dense_1/Tensordot/concat_1ConcatV2.sequential/dense_1/Tensordot/GatherV2:output:0-sequential/dense_1/Tensordot/Const_2:output:03sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:љ
sequential/dense_1/TensordotReshape-sequential/dense_1/Tensordot/MatMul:product:0.sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ш
)sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0ґ
sequential/dense_1/BiasAddBiasAdd%sequential/dense_1/Tensordot:output:01sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» \
dropout_1/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *д8О?Ъ
dropout_1/dropout/MulMul#sequential/dense_1/BiasAdd:output:0 dropout_1/dropout/Const:output:0*
T0*,
_output_shapes
:€€€€€€€€€» j
dropout_1/dropout/ShapeShape#sequential/dense_1/BiasAdd:output:0*
T0*
_output_shapes
:•
.dropout_1/dropout/random_uniform/RandomUniformRandomUniform dropout_1/dropout/Shape:output:0*
T0*,
_output_shapes
:€€€€€€€€€» *
dtype0e
 dropout_1/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ќћћ=…
dropout_1/dropout/GreaterEqualGreaterEqual7dropout_1/dropout/random_uniform/RandomUniform:output:0)dropout_1/dropout/GreaterEqual/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€» ^
dropout_1/dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    ј
dropout_1/dropout/SelectV2SelectV2"dropout_1/dropout/GreaterEqual:z:0dropout_1/dropout/Mul:z:0"dropout_1/dropout/Const_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» У
add_1AddV2'layer_normalization/batchnorm/add_1:z:0#dropout_1/dropout/SelectV2:output:0*
T0*,
_output_shapes
:€€€€€€€€€» ~
4layer_normalization_1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:Љ
"layer_normalization_1/moments/meanMean	add_1:z:0=layer_normalization_1/moments/mean/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(Ю
*layer_normalization_1/moments/StopGradientStopGradient+layer_normalization_1/moments/mean:output:0*
T0*,
_output_shapes
:€€€€€€€€€»ї
/layer_normalization_1/moments/SquaredDifferenceSquaredDifference	add_1:z:03layer_normalization_1/moments/StopGradient:output:0*
T0*,
_output_shapes
:€€€€€€€€€» В
8layer_normalization_1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:о
&layer_normalization_1/moments/varianceMean3layer_normalization_1/moments/SquaredDifference:z:0Alayer_normalization_1/moments/variance/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(j
%layer_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *љ7Ж5ƒ
#layer_normalization_1/batchnorm/addAddV2/layer_normalization_1/moments/variance:output:0.layer_normalization_1/batchnorm/add/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€»О
%layer_normalization_1/batchnorm/RsqrtRsqrt'layer_normalization_1/batchnorm/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€»™
2layer_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOp;layer_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0»
#layer_normalization_1/batchnorm/mulMul)layer_normalization_1/batchnorm/Rsqrt:y:0:layer_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» Ч
%layer_normalization_1/batchnorm/mul_1Mul	add_1:z:0'layer_normalization_1/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» є
%layer_normalization_1/batchnorm/mul_2Mul+layer_normalization_1/moments/mean:output:0'layer_normalization_1/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» Ґ
.layer_normalization_1/batchnorm/ReadVariableOpReadVariableOp7layer_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0ƒ
#layer_normalization_1/batchnorm/subSub6layer_normalization_1/batchnorm/ReadVariableOp:value:0)layer_normalization_1/batchnorm/mul_2:z:0*
T0*,
_output_shapes
:€€€€€€€€€» є
%layer_normalization_1/batchnorm/add_1AddV2)layer_normalization_1/batchnorm/mul_1:z:0'layer_normalization_1/batchnorm/sub:z:0*
T0*,
_output_shapes
:€€€€€€€€€» }
IdentityIdentity)layer_normalization_1/batchnorm/add_1:z:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» ш
NoOpNoOp-^layer_normalization/batchnorm/ReadVariableOp1^layer_normalization/batchnorm/mul/ReadVariableOp/^layer_normalization_1/batchnorm/ReadVariableOp3^layer_normalization_1/batchnorm/mul/ReadVariableOp9^multi_head_attention/attention_output/add/ReadVariableOpC^multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp,^multi_head_attention/key/add/ReadVariableOp6^multi_head_attention/key/einsum/Einsum/ReadVariableOp.^multi_head_attention/query/add/ReadVariableOp8^multi_head_attention/query/einsum/Einsum/ReadVariableOp.^multi_head_attention/value/add/ReadVariableOp8^multi_head_attention/value/einsum/Einsum/ReadVariableOp(^sequential/dense/BiasAdd/ReadVariableOp*^sequential/dense/Tensordot/ReadVariableOp*^sequential/dense_1/BiasAdd/ReadVariableOp,^sequential/dense_1/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8:€€€€€€€€€» : : : : : : : : : : : : : : : : 2\
,layer_normalization/batchnorm/ReadVariableOp,layer_normalization/batchnorm/ReadVariableOp2d
0layer_normalization/batchnorm/mul/ReadVariableOp0layer_normalization/batchnorm/mul/ReadVariableOp2`
.layer_normalization_1/batchnorm/ReadVariableOp.layer_normalization_1/batchnorm/ReadVariableOp2h
2layer_normalization_1/batchnorm/mul/ReadVariableOp2layer_normalization_1/batchnorm/mul/ReadVariableOp2t
8multi_head_attention/attention_output/add/ReadVariableOp8multi_head_attention/attention_output/add/ReadVariableOp2И
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp2Z
+multi_head_attention/key/add/ReadVariableOp+multi_head_attention/key/add/ReadVariableOp2n
5multi_head_attention/key/einsum/Einsum/ReadVariableOp5multi_head_attention/key/einsum/Einsum/ReadVariableOp2^
-multi_head_attention/query/add/ReadVariableOp-multi_head_attention/query/add/ReadVariableOp2r
7multi_head_attention/query/einsum/Einsum/ReadVariableOp7multi_head_attention/query/einsum/Einsum/ReadVariableOp2^
-multi_head_attention/value/add/ReadVariableOp-multi_head_attention/value/add/ReadVariableOp2r
7multi_head_attention/value/einsum/Einsum/ReadVariableOp7multi_head_attention/value/einsum/Einsum/ReadVariableOp2R
'sequential/dense/BiasAdd/ReadVariableOp'sequential/dense/BiasAdd/ReadVariableOp2V
)sequential/dense/Tensordot/ReadVariableOp)sequential/dense/Tensordot/ReadVariableOp2V
)sequential/dense_1/BiasAdd/ReadVariableOp)sequential/dense_1/BiasAdd/ReadVariableOp2Z
+sequential/dense_1/Tensordot/ReadVariableOp+sequential/dense_1/Tensordot/ReadVariableOp:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
Ђ
J
"__inference__update_step_xla_18100
gradient
variable: *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

: : *
	_noinline(:D @

_output_shapes
: 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Л
o
S__inference_global_average_pooling1d_layer_call_and_return_conditional_losses_18525

inputs
identityX
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :p
MeanMeaninputsMean/reduction_indices:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€^
IdentityIdentityMean:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):'€€€€€€€€€€€€€€€€€€€€€€€€€€€:e a
=
_output_shapes+
):'€€€€€€€€€€€€€€€€€€€€€€€€€€€
 
_user_specified_nameinputs
Л
o
S__inference_global_average_pooling1d_layer_call_and_return_conditional_losses_16618

inputs
identityX
Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :p
MeanMeaninputsMean/reduction_indices:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€^
IdentityIdentityMean:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):'€€€€€€€€€€€€€€€€€€€€€€€€€€€:e a
=
_output_shapes+
):'€€€€€€€€€€€€€€€€€€€€€€€€€€€
 
_user_specified_nameinputs
“=
ћ
E__inference_sequential_layer_call_and_return_conditional_losses_18702

inputs9
'dense_tensordot_readvariableop_resource:  3
%dense_biasadd_readvariableop_resource: ;
)dense_1_tensordot_readvariableop_resource:  5
'dense_1_biasadd_readvariableop_resource: 
identityИҐdense/BiasAdd/ReadVariableOpҐdense/Tensordot/ReadVariableOpҐdense_1/BiasAdd/ReadVariableOpҐ dense_1/Tensordot/ReadVariableOpЖ
dense/Tensordot/ReadVariableOpReadVariableOp'dense_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0^
dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:e
dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       K
dense/Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:_
dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ”
dense/Tensordot/GatherV2GatherV2dense/Tensordot/Shape:output:0dense/Tensordot/free:output:0&dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : „
dense/Tensordot/GatherV2_1GatherV2dense/Tensordot/Shape:output:0dense/Tensordot/axes:output:0(dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:_
dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: А
dense/Tensordot/ProdProd!dense/Tensordot/GatherV2:output:0dense/Tensordot/Const:output:0*
T0*
_output_shapes
: a
dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: Ж
dense/Tensordot/Prod_1Prod#dense/Tensordot/GatherV2_1:output:0 dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: ]
dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : і
dense/Tensordot/concatConcatV2dense/Tensordot/free:output:0dense/Tensordot/axes:output:0$dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:Л
dense/Tensordot/stackPackdense/Tensordot/Prod:output:0dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Ж
dense/Tensordot/transpose	Transposeinputsdense/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ь
dense/Tensordot/ReshapeReshapedense/Tensordot/transpose:y:0dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Ь
dense/Tensordot/MatMulMatMul dense/Tensordot/Reshape:output:0&dense/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ a
dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: _
dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : њ
dense/Tensordot/concat_1ConcatV2!dense/Tensordot/GatherV2:output:0 dense/Tensordot/Const_2:output:0&dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Ц
dense/TensordotReshape dense/Tensordot/MatMul:product:0!dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» ~
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0П
dense/BiasAddBiasAdddense/Tensordot:output:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» a

dense/ReluReludense/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€» К
 dense_1/Tensordot/ReadVariableOpReadVariableOp)dense_1_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0`
dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:g
dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       _
dense_1/Tensordot/ShapeShapedense/Relu:activations:0*
T0*
_output_shapes
:a
dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : џ
dense_1/Tensordot/GatherV2GatherV2 dense_1/Tensordot/Shape:output:0dense_1/Tensordot/free:output:0(dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:c
!dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : я
dense_1/Tensordot/GatherV2_1GatherV2 dense_1/Tensordot/Shape:output:0dense_1/Tensordot/axes:output:0*dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: Ж
dense_1/Tensordot/ProdProd#dense_1/Tensordot/GatherV2:output:0 dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: М
dense_1/Tensordot/Prod_1Prod%dense_1/Tensordot/GatherV2_1:output:0"dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Љ
dense_1/Tensordot/concatConcatV2dense_1/Tensordot/free:output:0dense_1/Tensordot/axes:output:0&dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:С
dense_1/Tensordot/stackPackdense_1/Tensordot/Prod:output:0!dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Ь
dense_1/Tensordot/transpose	Transposedense/Relu:activations:0!dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ґ
dense_1/Tensordot/ReshapeReshapedense_1/Tensordot/transpose:y:0 dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Ґ
dense_1/Tensordot/MatMulMatMul"dense_1/Tensordot/Reshape:output:0(dense_1/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ c
dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: a
dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : «
dense_1/Tensordot/concat_1ConcatV2#dense_1/Tensordot/GatherV2:output:0"dense_1/Tensordot/Const_2:output:0(dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Ь
dense_1/TensordotReshape"dense_1/Tensordot/MatMul:product:0#dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» В
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0Х
dense_1/BiasAddBiasAdddense_1/Tensordot:output:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» l
IdentityIdentitydense_1/BiasAdd:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€»  
NoOpNoOp^dense/BiasAdd/ReadVariableOp^dense/Tensordot/ReadVariableOp^dense_1/BiasAdd/ReadVariableOp!^dense_1/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :€€€€€€€€€» : : : : 2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2@
dense/Tensordot/ReadVariableOpdense/Tensordot/ReadVariableOp2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2D
 dense_1/Tensordot/ReadVariableOp dense_1/Tensordot/ReadVariableOp:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
йƒ
г
L__inference_transformer_block_layer_call_and_return_conditional_losses_18514

inputsV
@multi_head_attention_query_einsum_einsum_readvariableop_resource:  H
6multi_head_attention_query_add_readvariableop_resource: T
>multi_head_attention_key_einsum_einsum_readvariableop_resource:  F
4multi_head_attention_key_add_readvariableop_resource: V
@multi_head_attention_value_einsum_einsum_readvariableop_resource:  H
6multi_head_attention_value_add_readvariableop_resource: a
Kmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource:  O
Amulti_head_attention_attention_output_add_readvariableop_resource: G
9layer_normalization_batchnorm_mul_readvariableop_resource: C
5layer_normalization_batchnorm_readvariableop_resource: D
2sequential_dense_tensordot_readvariableop_resource:  >
0sequential_dense_biasadd_readvariableop_resource: F
4sequential_dense_1_tensordot_readvariableop_resource:  @
2sequential_dense_1_biasadd_readvariableop_resource: I
;layer_normalization_1_batchnorm_mul_readvariableop_resource: E
7layer_normalization_1_batchnorm_readvariableop_resource: 
identityИҐ,layer_normalization/batchnorm/ReadVariableOpҐ0layer_normalization/batchnorm/mul/ReadVariableOpҐ.layer_normalization_1/batchnorm/ReadVariableOpҐ2layer_normalization_1/batchnorm/mul/ReadVariableOpҐ8multi_head_attention/attention_output/add/ReadVariableOpҐBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpҐ+multi_head_attention/key/add/ReadVariableOpҐ5multi_head_attention/key/einsum/Einsum/ReadVariableOpҐ-multi_head_attention/query/add/ReadVariableOpҐ7multi_head_attention/query/einsum/Einsum/ReadVariableOpҐ-multi_head_attention/value/add/ReadVariableOpҐ7multi_head_attention/value/einsum/Einsum/ReadVariableOpҐ'sequential/dense/BiasAdd/ReadVariableOpҐ)sequential/dense/Tensordot/ReadVariableOpҐ)sequential/dense_1/BiasAdd/ReadVariableOpҐ+sequential/dense_1/Tensordot/ReadVariableOpЉ
7multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0№
(multi_head_attention/query/einsum/EinsumEinsuminputs?multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde§
-multi_head_attention/query/add/ReadVariableOpReadVariableOp6multi_head_attention_query_add_readvariableop_resource*
_output_shapes

: *
dtype0ћ
multi_head_attention/query/addAddV21multi_head_attention/query/einsum/Einsum:output:05multi_head_attention/query/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» Є
5multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOp>multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Ў
&multi_head_attention/key/einsum/EinsumEinsuminputs=multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde†
+multi_head_attention/key/add/ReadVariableOpReadVariableOp4multi_head_attention_key_add_readvariableop_resource*
_output_shapes

: *
dtype0∆
multi_head_attention/key/addAddV2/multi_head_attention/key/einsum/Einsum:output:03multi_head_attention/key/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» Љ
7multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0№
(multi_head_attention/value/einsum/EinsumEinsuminputs?multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde§
-multi_head_attention/value/add/ReadVariableOpReadVariableOp6multi_head_attention_value_add_readvariableop_resource*
_output_shapes

: *
dtype0ћ
multi_head_attention/value/addAddV21multi_head_attention/value/einsum/Einsum:output:05multi_head_attention/value/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» _
multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *у5>£
multi_head_attention/MulMul"multi_head_attention/query/add:z:0#multi_head_attention/Mul/y:output:0*
T0*0
_output_shapes
:€€€€€€€€€» –
"multi_head_attention/einsum/EinsumEinsum multi_head_attention/key/add:z:0multi_head_attention/Mul:z:0*
N*
T0*1
_output_shapes
:€€€€€€€€€»»*
equationaecd,abcd->acbeШ
$multi_head_attention/softmax/SoftmaxSoftmax+multi_head_attention/einsum/Einsum:output:0*
T0*1
_output_shapes
:€€€€€€€€€»»Э
%multi_head_attention/dropout/IdentityIdentity.multi_head_attention/softmax/Softmax:softmax:0*
T0*1
_output_shapes
:€€€€€€€€€»»е
$multi_head_attention/einsum_1/EinsumEinsum.multi_head_attention/dropout/Identity:output:0"multi_head_attention/value/add:z:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationacbe,aecd->abcd“
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpKmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Х
3multi_head_attention/attention_output/einsum/EinsumEinsum-multi_head_attention/einsum_1/Einsum:output:0Jmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*,
_output_shapes
:€€€€€€€€€» *
equationabcd,cde->abeґ
8multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpAmulti_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
: *
dtype0й
)multi_head_attention/attention_output/addAddV2<multi_head_attention/attention_output/einsum/Einsum:output:0@multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» Z
dropout/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *д8О?†
dropout/dropout/MulMul-multi_head_attention/attention_output/add:z:0dropout/dropout/Const:output:0*
T0*,
_output_shapes
:€€€€€€€€€» r
dropout/dropout/ShapeShape-multi_head_attention/attention_output/add:z:0*
T0*
_output_shapes
:°
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape:output:0*
T0*,
_output_shapes
:€€€€€€€€€» *
dtype0c
dropout/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ќћћ=√
dropout/dropout/GreaterEqualGreaterEqual5dropout/dropout/random_uniform/RandomUniform:output:0'dropout/dropout/GreaterEqual/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€» \
dropout/dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    Є
dropout/dropout/SelectV2SelectV2 dropout/dropout/GreaterEqual:z:0dropout/dropout/Mul:z:0 dropout/dropout/Const_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» n
addAddV2inputs!dropout/dropout/SelectV2:output:0*
T0*,
_output_shapes
:€€€€€€€€€» |
2layer_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:ґ
 layer_normalization/moments/meanMeanadd:z:0;layer_normalization/moments/mean/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(Ъ
(layer_normalization/moments/StopGradientStopGradient)layer_normalization/moments/mean:output:0*
T0*,
_output_shapes
:€€€€€€€€€»µ
-layer_normalization/moments/SquaredDifferenceSquaredDifferenceadd:z:01layer_normalization/moments/StopGradient:output:0*
T0*,
_output_shapes
:€€€€€€€€€» А
6layer_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:и
$layer_normalization/moments/varianceMean1layer_normalization/moments/SquaredDifference:z:0?layer_normalization/moments/variance/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(h
#layer_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *љ7Ж5Њ
!layer_normalization/batchnorm/addAddV2-layer_normalization/moments/variance:output:0,layer_normalization/batchnorm/add/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€»К
#layer_normalization/batchnorm/RsqrtRsqrt%layer_normalization/batchnorm/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€»¶
0layer_normalization/batchnorm/mul/ReadVariableOpReadVariableOp9layer_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0¬
!layer_normalization/batchnorm/mulMul'layer_normalization/batchnorm/Rsqrt:y:08layer_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» С
#layer_normalization/batchnorm/mul_1Muladd:z:0%layer_normalization/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ≥
#layer_normalization/batchnorm/mul_2Mul)layer_normalization/moments/mean:output:0%layer_normalization/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» Ю
,layer_normalization/batchnorm/ReadVariableOpReadVariableOp5layer_normalization_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0Њ
!layer_normalization/batchnorm/subSub4layer_normalization/batchnorm/ReadVariableOp:value:0'layer_normalization/batchnorm/mul_2:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ≥
#layer_normalization/batchnorm/add_1AddV2'layer_normalization/batchnorm/mul_1:z:0%layer_normalization/batchnorm/sub:z:0*
T0*,
_output_shapes
:€€€€€€€€€» Ь
)sequential/dense/Tensordot/ReadVariableOpReadVariableOp2sequential_dense_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0i
sequential/dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:p
sequential/dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       w
 sequential/dense/Tensordot/ShapeShape'layer_normalization/batchnorm/add_1:z:0*
T0*
_output_shapes
:j
(sequential/dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : €
#sequential/dense/Tensordot/GatherV2GatherV2)sequential/dense/Tensordot/Shape:output:0(sequential/dense/Tensordot/free:output:01sequential/dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
*sequential/dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Г
%sequential/dense/Tensordot/GatherV2_1GatherV2)sequential/dense/Tensordot/Shape:output:0(sequential/dense/Tensordot/axes:output:03sequential/dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:j
 sequential/dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: °
sequential/dense/Tensordot/ProdProd,sequential/dense/Tensordot/GatherV2:output:0)sequential/dense/Tensordot/Const:output:0*
T0*
_output_shapes
: l
"sequential/dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: І
!sequential/dense/Tensordot/Prod_1Prod.sequential/dense/Tensordot/GatherV2_1:output:0+sequential/dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: h
&sequential/dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : а
!sequential/dense/Tensordot/concatConcatV2(sequential/dense/Tensordot/free:output:0(sequential/dense/Tensordot/axes:output:0/sequential/dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:ђ
 sequential/dense/Tensordot/stackPack(sequential/dense/Tensordot/Prod:output:0*sequential/dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:љ
$sequential/dense/Tensordot/transpose	Transpose'layer_normalization/batchnorm/add_1:z:0*sequential/dense/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» љ
"sequential/dense/Tensordot/ReshapeReshape(sequential/dense/Tensordot/transpose:y:0)sequential/dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€љ
!sequential/dense/Tensordot/MatMulMatMul+sequential/dense/Tensordot/Reshape:output:01sequential/dense/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ l
"sequential/dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: j
(sequential/dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : л
#sequential/dense/Tensordot/concat_1ConcatV2,sequential/dense/Tensordot/GatherV2:output:0+sequential/dense/Tensordot/Const_2:output:01sequential/dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Ј
sequential/dense/TensordotReshape+sequential/dense/Tensordot/MatMul:product:0,sequential/dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ф
'sequential/dense/BiasAdd/ReadVariableOpReadVariableOp0sequential_dense_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0∞
sequential/dense/BiasAddBiasAdd#sequential/dense/Tensordot:output:0/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» w
sequential/dense/ReluRelu!sequential/dense/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€» †
+sequential/dense_1/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0k
!sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:r
!sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       u
"sequential/dense_1/Tensordot/ShapeShape#sequential/dense/Relu:activations:0*
T0*
_output_shapes
:l
*sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : З
%sequential/dense_1/Tensordot/GatherV2GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/free:output:03sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
,sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Л
'sequential/dense_1/Tensordot/GatherV2_1GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/axes:output:05sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
"sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: І
!sequential/dense_1/Tensordot/ProdProd.sequential/dense_1/Tensordot/GatherV2:output:0+sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≠
#sequential/dense_1/Tensordot/Prod_1Prod0sequential/dense_1/Tensordot/GatherV2_1:output:0-sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : и
#sequential/dense_1/Tensordot/concatConcatV2*sequential/dense_1/Tensordot/free:output:0*sequential/dense_1/Tensordot/axes:output:01sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:≤
"sequential/dense_1/Tensordot/stackPack*sequential/dense_1/Tensordot/Prod:output:0,sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:љ
&sequential/dense_1/Tensordot/transpose	Transpose#sequential/dense/Relu:activations:0,sequential/dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» √
$sequential/dense_1/Tensordot/ReshapeReshape*sequential/dense_1/Tensordot/transpose:y:0+sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€√
#sequential/dense_1/Tensordot/MatMulMatMul-sequential/dense_1/Tensordot/Reshape:output:03sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ n
$sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: l
*sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : у
%sequential/dense_1/Tensordot/concat_1ConcatV2.sequential/dense_1/Tensordot/GatherV2:output:0-sequential/dense_1/Tensordot/Const_2:output:03sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:љ
sequential/dense_1/TensordotReshape-sequential/dense_1/Tensordot/MatMul:product:0.sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ш
)sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0ґ
sequential/dense_1/BiasAddBiasAdd%sequential/dense_1/Tensordot:output:01sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» \
dropout_1/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *д8О?Ъ
dropout_1/dropout/MulMul#sequential/dense_1/BiasAdd:output:0 dropout_1/dropout/Const:output:0*
T0*,
_output_shapes
:€€€€€€€€€» j
dropout_1/dropout/ShapeShape#sequential/dense_1/BiasAdd:output:0*
T0*
_output_shapes
:•
.dropout_1/dropout/random_uniform/RandomUniformRandomUniform dropout_1/dropout/Shape:output:0*
T0*,
_output_shapes
:€€€€€€€€€» *
dtype0e
 dropout_1/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ќћћ=…
dropout_1/dropout/GreaterEqualGreaterEqual7dropout_1/dropout/random_uniform/RandomUniform:output:0)dropout_1/dropout/GreaterEqual/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€» ^
dropout_1/dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    ј
dropout_1/dropout/SelectV2SelectV2"dropout_1/dropout/GreaterEqual:z:0dropout_1/dropout/Mul:z:0"dropout_1/dropout/Const_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» У
add_1AddV2'layer_normalization/batchnorm/add_1:z:0#dropout_1/dropout/SelectV2:output:0*
T0*,
_output_shapes
:€€€€€€€€€» ~
4layer_normalization_1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:Љ
"layer_normalization_1/moments/meanMean	add_1:z:0=layer_normalization_1/moments/mean/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(Ю
*layer_normalization_1/moments/StopGradientStopGradient+layer_normalization_1/moments/mean:output:0*
T0*,
_output_shapes
:€€€€€€€€€»ї
/layer_normalization_1/moments/SquaredDifferenceSquaredDifference	add_1:z:03layer_normalization_1/moments/StopGradient:output:0*
T0*,
_output_shapes
:€€€€€€€€€» В
8layer_normalization_1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:о
&layer_normalization_1/moments/varianceMean3layer_normalization_1/moments/SquaredDifference:z:0Alayer_normalization_1/moments/variance/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(j
%layer_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *љ7Ж5ƒ
#layer_normalization_1/batchnorm/addAddV2/layer_normalization_1/moments/variance:output:0.layer_normalization_1/batchnorm/add/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€»О
%layer_normalization_1/batchnorm/RsqrtRsqrt'layer_normalization_1/batchnorm/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€»™
2layer_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOp;layer_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0»
#layer_normalization_1/batchnorm/mulMul)layer_normalization_1/batchnorm/Rsqrt:y:0:layer_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» Ч
%layer_normalization_1/batchnorm/mul_1Mul	add_1:z:0'layer_normalization_1/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» є
%layer_normalization_1/batchnorm/mul_2Mul+layer_normalization_1/moments/mean:output:0'layer_normalization_1/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» Ґ
.layer_normalization_1/batchnorm/ReadVariableOpReadVariableOp7layer_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0ƒ
#layer_normalization_1/batchnorm/subSub6layer_normalization_1/batchnorm/ReadVariableOp:value:0)layer_normalization_1/batchnorm/mul_2:z:0*
T0*,
_output_shapes
:€€€€€€€€€» є
%layer_normalization_1/batchnorm/add_1AddV2)layer_normalization_1/batchnorm/mul_1:z:0'layer_normalization_1/batchnorm/sub:z:0*
T0*,
_output_shapes
:€€€€€€€€€» }
IdentityIdentity)layer_normalization_1/batchnorm/add_1:z:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» ш
NoOpNoOp-^layer_normalization/batchnorm/ReadVariableOp1^layer_normalization/batchnorm/mul/ReadVariableOp/^layer_normalization_1/batchnorm/ReadVariableOp3^layer_normalization_1/batchnorm/mul/ReadVariableOp9^multi_head_attention/attention_output/add/ReadVariableOpC^multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp,^multi_head_attention/key/add/ReadVariableOp6^multi_head_attention/key/einsum/Einsum/ReadVariableOp.^multi_head_attention/query/add/ReadVariableOp8^multi_head_attention/query/einsum/Einsum/ReadVariableOp.^multi_head_attention/value/add/ReadVariableOp8^multi_head_attention/value/einsum/Einsum/ReadVariableOp(^sequential/dense/BiasAdd/ReadVariableOp*^sequential/dense/Tensordot/ReadVariableOp*^sequential/dense_1/BiasAdd/ReadVariableOp,^sequential/dense_1/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*K
_input_shapes:
8:€€€€€€€€€» : : : : : : : : : : : : : : : : 2\
,layer_normalization/batchnorm/ReadVariableOp,layer_normalization/batchnorm/ReadVariableOp2d
0layer_normalization/batchnorm/mul/ReadVariableOp0layer_normalization/batchnorm/mul/ReadVariableOp2`
.layer_normalization_1/batchnorm/ReadVariableOp.layer_normalization_1/batchnorm/ReadVariableOp2h
2layer_normalization_1/batchnorm/mul/ReadVariableOp2layer_normalization_1/batchnorm/mul/ReadVariableOp2t
8multi_head_attention/attention_output/add/ReadVariableOp8multi_head_attention/attention_output/add/ReadVariableOp2И
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp2Z
+multi_head_attention/key/add/ReadVariableOp+multi_head_attention/key/add/ReadVariableOp2n
5multi_head_attention/key/einsum/Einsum/ReadVariableOp5multi_head_attention/key/einsum/Einsum/ReadVariableOp2^
-multi_head_attention/query/add/ReadVariableOp-multi_head_attention/query/add/ReadVariableOp2r
7multi_head_attention/query/einsum/Einsum/ReadVariableOp7multi_head_attention/query/einsum/Einsum/ReadVariableOp2^
-multi_head_attention/value/add/ReadVariableOp-multi_head_attention/value/add/ReadVariableOp2r
7multi_head_attention/value/einsum/Einsum/ReadVariableOp7multi_head_attention/value/einsum/Einsum/ReadVariableOp2R
'sequential/dense/BiasAdd/ReadVariableOp'sequential/dense/BiasAdd/ReadVariableOp2V
)sequential/dense/Tensordot/ReadVariableOp)sequential/dense/Tensordot/ReadVariableOp2V
)sequential/dense_1/BiasAdd/ReadVariableOp)sequential/dense_1/BiasAdd/ReadVariableOp2Z
+sequential/dense_1/Tensordot/ReadVariableOp+sequential/dense_1/Tensordot/ReadVariableOp:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
≤,
Ё	
@__inference_model_layer_call_and_return_conditional_losses_17313

inputs5
"token_and_position_embedding_17261:	» 6
"token_and_position_embedding_17263:
†Ь -
transformer_block_17266:  )
transformer_block_17268: -
transformer_block_17270:  )
transformer_block_17272: -
transformer_block_17274:  )
transformer_block_17276: -
transformer_block_17278:  %
transformer_block_17280: %
transformer_block_17282: %
transformer_block_17284: )
transformer_block_17286:  %
transformer_block_17288: )
transformer_block_17290:  %
transformer_block_17292: %
transformer_block_17294: %
transformer_block_17296: 
dense_2_17301: 
dense_2_17303:
dense_3_17307:
dense_3_17309:
identityИҐdense_2/StatefulPartitionedCallҐdense_3/StatefulPartitionedCallҐ!dropout_2/StatefulPartitionedCallҐ!dropout_3/StatefulPartitionedCallҐ4token_and_position_embedding/StatefulPartitionedCallҐ)transformer_block/StatefulPartitionedCall≈
4token_and_position_embedding/StatefulPartitionedCallStatefulPartitionedCallinputs"token_and_position_embedding_17261"token_and_position_embedding_17263*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *`
f[RY
W__inference_token_and_position_embedding_layer_call_and_return_conditional_losses_16651 
)transformer_block/StatefulPartitionedCallStatefulPartitionedCall=token_and_position_embedding/StatefulPartitionedCall:output:0transformer_block_17266transformer_block_17268transformer_block_17270transformer_block_17272transformer_block_17274transformer_block_17276transformer_block_17278transformer_block_17280transformer_block_17282transformer_block_17284transformer_block_17286transformer_block_17288transformer_block_17290transformer_block_17292transformer_block_17294transformer_block_17296*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *2
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *U
fPRN
L__inference_transformer_block_layer_call_and_return_conditional_losses_17162Ж
(global_average_pooling1d/PartitionedCallPartitionedCall2transformer_block/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *\
fWRU
S__inference_global_average_pooling1d_layer_call_and_return_conditional_losses_16618ч
!dropout_2/StatefulPartitionedCallStatefulPartitionedCall1global_average_pooling1d/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_16978Р
dense_2/StatefulPartitionedCallStatefulPartitionedCall*dropout_2/StatefulPartitionedCall:output:0dense_2_17301dense_2_17303*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_16837Т
!dropout_3/StatefulPartitionedCallStatefulPartitionedCall(dense_2/StatefulPartitionedCall:output:0"^dropout_2/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_16945Р
dense_3/StatefulPartitionedCallStatefulPartitionedCall*dropout_3/StatefulPartitionedCall:output:0dense_3_17307dense_3_17309*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_16861w
IdentityIdentity(dense_3/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€µ
NoOpNoOp ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall"^dropout_2/StatefulPartitionedCall"^dropout_3/StatefulPartitionedCall5^token_and_position_embedding/StatefulPartitionedCall*^transformer_block/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:€€€€€€€€€»: : : : : : : : : : : : : : : : : : : : : : 2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2F
!dropout_2/StatefulPartitionedCall!dropout_2/StatefulPartitionedCall2F
!dropout_3/StatefulPartitionedCall!dropout_3/StatefulPartitionedCall2l
4token_and_position_embedding/StatefulPartitionedCall4token_and_position_embedding/StatefulPartitionedCall2V
)transformer_block/StatefulPartitionedCall)transformer_block/StatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€»
 
_user_specified_nameinputs
Є
‘
%__inference_model_layer_call_fn_17621

inputs
unknown:	» 
	unknown_0:
†Ь 
	unknown_1:  
	unknown_2: 
	unknown_3:  
	unknown_4: 
	unknown_5:  
	unknown_6: 
	unknown_7:  
	unknown_8: 
	unknown_9: 

unknown_10: 

unknown_11:  

unknown_12: 

unknown_13:  

unknown_14: 

unknown_15: 

unknown_16: 

unknown_17: 

unknown_18:

unknown_19:

unknown_20:
identityИҐStatefulPartitionedCallз
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20*"
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*8
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_model_layer_call_and_return_conditional_losses_16868o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:€€€€€€€€€»: : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€»
 
_user_specified_nameinputs
ѕ
щ
B__inference_dense_1_layer_call_and_return_conditional_losses_16489

inputs3
!tensordot_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identityИҐBiasAdd/ReadVariableOpҐTensordot/ReadVariableOpz
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ї
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : њ
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Ь
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:z
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» К
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€К
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ [
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : І
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Д
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» d
IdentityIdentityBiasAdd:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€» : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
Ђ
J
"__inference__update_step_xla_18105
gradient
variable: *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

: : *
	_noinline(:D @

_output_shapes
: 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
…
N
"__inference__update_step_xla_18095
gradient
variable:  *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*(
_input_shapes
:€€€€€€€€€ : *
	_noinline(:Q M
'
_output_shapes
:€€€€€€€€€ 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Ю

у
B__inference_dense_3_layer_call_and_return_conditional_losses_16861

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identityИҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€V
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€`
IdentityIdentitySoftmax:softmax:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
†
E
)__inference_dropout_2_layer_call_fn_18530

inputs
identity≤
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_16824`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:€€€€€€€€€ "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€ :O K
'
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
Щ
”
#__inference_signature_wrapper_17572
input_1
unknown:	» 
	unknown_0:
†Ь 
	unknown_1:  
	unknown_2: 
	unknown_3:  
	unknown_4: 
	unknown_5:  
	unknown_6: 
	unknown_7:  
	unknown_8: 
	unknown_9: 

unknown_10: 

unknown_11:  

unknown_12: 

unknown_13:  

unknown_14: 

unknown_15: 

unknown_16: 

unknown_17: 

unknown_18:

unknown_19:

unknown_20:
identityИҐStatefulPartitionedCall»
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20*"
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*8
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *)
f$R"
 __inference__wrapped_model_16415o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:€€€€€€€€€»: : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:€€€€€€€€€»
!
_user_specified_name	input_1
Є
‘
%__inference_model_layer_call_fn_17670

inputs
unknown:	» 
	unknown_0:
†Ь 
	unknown_1:  
	unknown_2: 
	unknown_3:  
	unknown_4: 
	unknown_5:  
	unknown_6: 
	unknown_7:  
	unknown_8: 
	unknown_9: 

unknown_10: 

unknown_11:  

unknown_12: 

unknown_13:  

unknown_14: 

unknown_15: 

unknown_16: 

unknown_17: 

unknown_18:

unknown_19:

unknown_20:
identityИҐStatefulPartitionedCallз
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20*"
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*8
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_model_layer_call_and_return_conditional_losses_17313o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:€€€€€€€€€»: : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€»
 
_user_specified_nameinputs
√
R
"__inference__update_step_xla_18065
gradient
variable:  *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*#
_input_shapes
:  : *
	_noinline(:L H
"
_output_shapes
:  
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Ђ
J
"__inference__update_step_xla_18110
gradient
variable: *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

: : *
	_noinline(:D @

_output_shapes
: 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
√
R
"__inference__update_step_xla_18045
gradient
variable:  *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*#
_input_shapes
:  : *
	_noinline(:L H
"
_output_shapes
:  
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Ѕ)
Ц	
@__inference_model_layer_call_and_return_conditional_losses_17464
input_15
"token_and_position_embedding_17412:	» 6
"token_and_position_embedding_17414:
†Ь -
transformer_block_17417:  )
transformer_block_17419: -
transformer_block_17421:  )
transformer_block_17423: -
transformer_block_17425:  )
transformer_block_17427: -
transformer_block_17429:  %
transformer_block_17431: %
transformer_block_17433: %
transformer_block_17435: )
transformer_block_17437:  %
transformer_block_17439: )
transformer_block_17441:  %
transformer_block_17443: %
transformer_block_17445: %
transformer_block_17447: 
dense_2_17452: 
dense_2_17454:
dense_3_17458:
dense_3_17460:
identityИҐdense_2/StatefulPartitionedCallҐdense_3/StatefulPartitionedCallҐ4token_and_position_embedding/StatefulPartitionedCallҐ)transformer_block/StatefulPartitionedCall∆
4token_and_position_embedding/StatefulPartitionedCallStatefulPartitionedCallinput_1"token_and_position_embedding_17412"token_and_position_embedding_17414*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *`
f[RY
W__inference_token_and_position_embedding_layer_call_and_return_conditional_losses_16651 
)transformer_block/StatefulPartitionedCallStatefulPartitionedCall=token_and_position_embedding/StatefulPartitionedCall:output:0transformer_block_17417transformer_block_17419transformer_block_17421transformer_block_17423transformer_block_17425transformer_block_17427transformer_block_17429transformer_block_17431transformer_block_17433transformer_block_17435transformer_block_17437transformer_block_17439transformer_block_17441transformer_block_17443transformer_block_17445transformer_block_17447*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *2
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *U
fPRN
L__inference_transformer_block_layer_call_and_return_conditional_losses_16784Ж
(global_average_pooling1d/PartitionedCallPartitionedCall2transformer_block/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *\
fWRU
S__inference_global_average_pooling1d_layer_call_and_return_conditional_losses_16618з
dropout_2/PartitionedCallPartitionedCall1global_average_pooling1d/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_16824И
dense_2/StatefulPartitionedCallStatefulPartitionedCall"dropout_2/PartitionedCall:output:0dense_2_17452dense_2_17454*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_16837ё
dropout_3/PartitionedCallPartitionedCall(dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_16848И
dense_3/StatefulPartitionedCallStatefulPartitionedCall"dropout_3/PartitionedCall:output:0dense_3_17458dense_3_17460*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_16861w
IdentityIdentity(dense_3/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€н
NoOpNoOp ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall5^token_and_position_embedding/StatefulPartitionedCall*^transformer_block/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:€€€€€€€€€»: : : : : : : : : : : : : : : : : : : : : : 2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2l
4token_and_position_embedding/StatefulPartitionedCall4token_and_position_embedding/StatefulPartitionedCall2V
)transformer_block/StatefulPartitionedCall)transformer_block/StatefulPartitionedCall:Q M
(
_output_shapes
:€€€€€€€€€»
!
_user_specified_name	input_1
Њ
“
*__inference_sequential_layer_call_fn_16507
dense_input
unknown:  
	unknown_0: 
	unknown_1:  
	unknown_2: 
identityИҐStatefulPartitionedCallБ
StatefulPartitionedCallStatefulPartitionedCalldense_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_16496t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :€€€€€€€€€» : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
,
_output_shapes
:€€€€€€€€€» 
%
_user_specified_namedense_input
ШЦ
Ё(
__inference__traced_save_19077
file_prefix-
)savev2_dense_2_kernel_read_readvariableop+
'savev2_dense_2_bias_read_readvariableop-
)savev2_dense_3_kernel_read_readvariableop+
'savev2_dense_3_bias_read_readvariableopP
Lsavev2_token_and_position_embedding_embedding_embeddings_read_readvariableopR
Nsavev2_token_and_position_embedding_embedding_1_embeddings_read_readvariableopR
Nsavev2_transformer_block_multi_head_attention_query_kernel_read_readvariableopP
Lsavev2_transformer_block_multi_head_attention_query_bias_read_readvariableopP
Lsavev2_transformer_block_multi_head_attention_key_kernel_read_readvariableopN
Jsavev2_transformer_block_multi_head_attention_key_bias_read_readvariableopR
Nsavev2_transformer_block_multi_head_attention_value_kernel_read_readvariableopP
Lsavev2_transformer_block_multi_head_attention_value_bias_read_readvariableop]
Ysavev2_transformer_block_multi_head_attention_attention_output_kernel_read_readvariableop[
Wsavev2_transformer_block_multi_head_attention_attention_output_bias_read_readvariableop+
'savev2_dense_kernel_read_readvariableop)
%savev2_dense_bias_read_readvariableop-
)savev2_dense_1_kernel_read_readvariableop+
'savev2_dense_1_bias_read_readvariableopJ
Fsavev2_transformer_block_layer_normalization_gamma_read_readvariableopI
Esavev2_transformer_block_layer_normalization_beta_read_readvariableopL
Hsavev2_transformer_block_layer_normalization_1_gamma_read_readvariableopK
Gsavev2_transformer_block_layer_normalization_1_beta_read_readvariableop(
$savev2_iteration_read_readvariableop	,
(savev2_learning_rate_read_readvariableopW
Ssavev2_adam_m_token_and_position_embedding_embedding_embeddings_read_readvariableopW
Ssavev2_adam_v_token_and_position_embedding_embedding_embeddings_read_readvariableopY
Usavev2_adam_m_token_and_position_embedding_embedding_1_embeddings_read_readvariableopY
Usavev2_adam_v_token_and_position_embedding_embedding_1_embeddings_read_readvariableopY
Usavev2_adam_m_transformer_block_multi_head_attention_query_kernel_read_readvariableopY
Usavev2_adam_v_transformer_block_multi_head_attention_query_kernel_read_readvariableopW
Ssavev2_adam_m_transformer_block_multi_head_attention_query_bias_read_readvariableopW
Ssavev2_adam_v_transformer_block_multi_head_attention_query_bias_read_readvariableopW
Ssavev2_adam_m_transformer_block_multi_head_attention_key_kernel_read_readvariableopW
Ssavev2_adam_v_transformer_block_multi_head_attention_key_kernel_read_readvariableopU
Qsavev2_adam_m_transformer_block_multi_head_attention_key_bias_read_readvariableopU
Qsavev2_adam_v_transformer_block_multi_head_attention_key_bias_read_readvariableopY
Usavev2_adam_m_transformer_block_multi_head_attention_value_kernel_read_readvariableopY
Usavev2_adam_v_transformer_block_multi_head_attention_value_kernel_read_readvariableopW
Ssavev2_adam_m_transformer_block_multi_head_attention_value_bias_read_readvariableopW
Ssavev2_adam_v_transformer_block_multi_head_attention_value_bias_read_readvariableopd
`savev2_adam_m_transformer_block_multi_head_attention_attention_output_kernel_read_readvariableopd
`savev2_adam_v_transformer_block_multi_head_attention_attention_output_kernel_read_readvariableopb
^savev2_adam_m_transformer_block_multi_head_attention_attention_output_bias_read_readvariableopb
^savev2_adam_v_transformer_block_multi_head_attention_attention_output_bias_read_readvariableop2
.savev2_adam_m_dense_kernel_read_readvariableop2
.savev2_adam_v_dense_kernel_read_readvariableop0
,savev2_adam_m_dense_bias_read_readvariableop0
,savev2_adam_v_dense_bias_read_readvariableop4
0savev2_adam_m_dense_1_kernel_read_readvariableop4
0savev2_adam_v_dense_1_kernel_read_readvariableop2
.savev2_adam_m_dense_1_bias_read_readvariableop2
.savev2_adam_v_dense_1_bias_read_readvariableopQ
Msavev2_adam_m_transformer_block_layer_normalization_gamma_read_readvariableopQ
Msavev2_adam_v_transformer_block_layer_normalization_gamma_read_readvariableopP
Lsavev2_adam_m_transformer_block_layer_normalization_beta_read_readvariableopP
Lsavev2_adam_v_transformer_block_layer_normalization_beta_read_readvariableopS
Osavev2_adam_m_transformer_block_layer_normalization_1_gamma_read_readvariableopS
Osavev2_adam_v_transformer_block_layer_normalization_1_gamma_read_readvariableopR
Nsavev2_adam_m_transformer_block_layer_normalization_1_beta_read_readvariableopR
Nsavev2_adam_v_transformer_block_layer_normalization_1_beta_read_readvariableop4
0savev2_adam_m_dense_2_kernel_read_readvariableop4
0savev2_adam_v_dense_2_kernel_read_readvariableop2
.savev2_adam_m_dense_2_bias_read_readvariableop2
.savev2_adam_v_dense_2_bias_read_readvariableop4
0savev2_adam_m_dense_3_kernel_read_readvariableop4
0savev2_adam_v_dense_3_kernel_read_readvariableop2
.savev2_adam_m_dense_3_bias_read_readvariableop2
.savev2_adam_v_dense_3_bias_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop
savev2_const

identity_1ИҐMergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/partБ
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : У
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: д
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:I*
dtype0*Н
valueГBАIB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB&variables/8/.ATTRIBUTES/VARIABLE_VALUEB&variables/9/.ATTRIBUTES/VARIABLE_VALUEB'variables/10/.ATTRIBUTES/VARIABLE_VALUEB'variables/11/.ATTRIBUTES/VARIABLE_VALUEB'variables/12/.ATTRIBUTES/VARIABLE_VALUEB'variables/13/.ATTRIBUTES/VARIABLE_VALUEB'variables/14/.ATTRIBUTES/VARIABLE_VALUEB'variables/15/.ATTRIBUTES/VARIABLE_VALUEB'variables/16/.ATTRIBUTES/VARIABLE_VALUEB'variables/17/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/13/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/14/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/15/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/16/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/17/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/18/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/19/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/20/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/21/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/22/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/23/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/24/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/25/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/26/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/27/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/28/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/29/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/30/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/31/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/32/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/33/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/34/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/35/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/36/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/37/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/38/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/39/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/40/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/41/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/42/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/43/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/44/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHВ
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:I*
dtype0*І
valueЭBЪIB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B т'
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0)savev2_dense_2_kernel_read_readvariableop'savev2_dense_2_bias_read_readvariableop)savev2_dense_3_kernel_read_readvariableop'savev2_dense_3_bias_read_readvariableopLsavev2_token_and_position_embedding_embedding_embeddings_read_readvariableopNsavev2_token_and_position_embedding_embedding_1_embeddings_read_readvariableopNsavev2_transformer_block_multi_head_attention_query_kernel_read_readvariableopLsavev2_transformer_block_multi_head_attention_query_bias_read_readvariableopLsavev2_transformer_block_multi_head_attention_key_kernel_read_readvariableopJsavev2_transformer_block_multi_head_attention_key_bias_read_readvariableopNsavev2_transformer_block_multi_head_attention_value_kernel_read_readvariableopLsavev2_transformer_block_multi_head_attention_value_bias_read_readvariableopYsavev2_transformer_block_multi_head_attention_attention_output_kernel_read_readvariableopWsavev2_transformer_block_multi_head_attention_attention_output_bias_read_readvariableop'savev2_dense_kernel_read_readvariableop%savev2_dense_bias_read_readvariableop)savev2_dense_1_kernel_read_readvariableop'savev2_dense_1_bias_read_readvariableopFsavev2_transformer_block_layer_normalization_gamma_read_readvariableopEsavev2_transformer_block_layer_normalization_beta_read_readvariableopHsavev2_transformer_block_layer_normalization_1_gamma_read_readvariableopGsavev2_transformer_block_layer_normalization_1_beta_read_readvariableop$savev2_iteration_read_readvariableop(savev2_learning_rate_read_readvariableopSsavev2_adam_m_token_and_position_embedding_embedding_embeddings_read_readvariableopSsavev2_adam_v_token_and_position_embedding_embedding_embeddings_read_readvariableopUsavev2_adam_m_token_and_position_embedding_embedding_1_embeddings_read_readvariableopUsavev2_adam_v_token_and_position_embedding_embedding_1_embeddings_read_readvariableopUsavev2_adam_m_transformer_block_multi_head_attention_query_kernel_read_readvariableopUsavev2_adam_v_transformer_block_multi_head_attention_query_kernel_read_readvariableopSsavev2_adam_m_transformer_block_multi_head_attention_query_bias_read_readvariableopSsavev2_adam_v_transformer_block_multi_head_attention_query_bias_read_readvariableopSsavev2_adam_m_transformer_block_multi_head_attention_key_kernel_read_readvariableopSsavev2_adam_v_transformer_block_multi_head_attention_key_kernel_read_readvariableopQsavev2_adam_m_transformer_block_multi_head_attention_key_bias_read_readvariableopQsavev2_adam_v_transformer_block_multi_head_attention_key_bias_read_readvariableopUsavev2_adam_m_transformer_block_multi_head_attention_value_kernel_read_readvariableopUsavev2_adam_v_transformer_block_multi_head_attention_value_kernel_read_readvariableopSsavev2_adam_m_transformer_block_multi_head_attention_value_bias_read_readvariableopSsavev2_adam_v_transformer_block_multi_head_attention_value_bias_read_readvariableop`savev2_adam_m_transformer_block_multi_head_attention_attention_output_kernel_read_readvariableop`savev2_adam_v_transformer_block_multi_head_attention_attention_output_kernel_read_readvariableop^savev2_adam_m_transformer_block_multi_head_attention_attention_output_bias_read_readvariableop^savev2_adam_v_transformer_block_multi_head_attention_attention_output_bias_read_readvariableop.savev2_adam_m_dense_kernel_read_readvariableop.savev2_adam_v_dense_kernel_read_readvariableop,savev2_adam_m_dense_bias_read_readvariableop,savev2_adam_v_dense_bias_read_readvariableop0savev2_adam_m_dense_1_kernel_read_readvariableop0savev2_adam_v_dense_1_kernel_read_readvariableop.savev2_adam_m_dense_1_bias_read_readvariableop.savev2_adam_v_dense_1_bias_read_readvariableopMsavev2_adam_m_transformer_block_layer_normalization_gamma_read_readvariableopMsavev2_adam_v_transformer_block_layer_normalization_gamma_read_readvariableopLsavev2_adam_m_transformer_block_layer_normalization_beta_read_readvariableopLsavev2_adam_v_transformer_block_layer_normalization_beta_read_readvariableopOsavev2_adam_m_transformer_block_layer_normalization_1_gamma_read_readvariableopOsavev2_adam_v_transformer_block_layer_normalization_1_gamma_read_readvariableopNsavev2_adam_m_transformer_block_layer_normalization_1_beta_read_readvariableopNsavev2_adam_v_transformer_block_layer_normalization_1_beta_read_readvariableop0savev2_adam_m_dense_2_kernel_read_readvariableop0savev2_adam_v_dense_2_kernel_read_readvariableop.savev2_adam_m_dense_2_bias_read_readvariableop.savev2_adam_v_dense_2_bias_read_readvariableop0savev2_adam_m_dense_3_kernel_read_readvariableop0savev2_adam_v_dense_3_kernel_read_readvariableop.savev2_adam_m_dense_3_bias_read_readvariableop.savev2_adam_v_dense_3_bias_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableopsavev2_const"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *W
dtypesM
K2I	Р
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:≥
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*Ж
_input_shapesф
с: : ::::
†Ь :	» :  : :  : :  : :  : :  : :  : : : : : : : :
†Ь :
†Ь :	» :	» :  :  : : :  :  : : :  :  : : :  :  : : :  :  : : :  :  : : : : : : : : : : : : ::::::: : : : : 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:$ 

_output_shapes

: : 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::&"
 
_output_shapes
:
†Ь :%!

_output_shapes
:	» :($
"
_output_shapes
:  :$ 

_output_shapes

: :(	$
"
_output_shapes
:  :$
 

_output_shapes

: :($
"
_output_shapes
:  :$ 

_output_shapes

: :($
"
_output_shapes
:  : 

_output_shapes
: :$ 

_output_shapes

:  : 

_output_shapes
: :$ 

_output_shapes

:  : 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
: : 

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :&"
 
_output_shapes
:
†Ь :&"
 
_output_shapes
:
†Ь :%!

_output_shapes
:	» :%!

_output_shapes
:	» :($
"
_output_shapes
:  :($
"
_output_shapes
:  :$ 

_output_shapes

: :$  

_output_shapes

: :(!$
"
_output_shapes
:  :("$
"
_output_shapes
:  :$# 

_output_shapes

: :$$ 

_output_shapes

: :(%$
"
_output_shapes
:  :(&$
"
_output_shapes
:  :$' 

_output_shapes

: :$( 

_output_shapes

: :()$
"
_output_shapes
:  :(*$
"
_output_shapes
:  : +

_output_shapes
: : ,

_output_shapes
: :$- 

_output_shapes

:  :$. 

_output_shapes

:  : /

_output_shapes
: : 0

_output_shapes
: :$1 

_output_shapes

:  :$2 

_output_shapes

:  : 3

_output_shapes
: : 4

_output_shapes
: : 5

_output_shapes
: : 6

_output_shapes
: : 7

_output_shapes
: : 8

_output_shapes
: : 9

_output_shapes
: : :

_output_shapes
: : ;

_output_shapes
: : <

_output_shapes
: :$= 

_output_shapes

: :$> 

_output_shapes

: : ?

_output_shapes
:: @

_output_shapes
::$A 

_output_shapes

::$B 

_output_shapes

:: C

_output_shapes
:: D

_output_shapes
::E

_output_shapes
: :F

_output_shapes
: :G

_output_shapes
: :H

_output_shapes
: :I

_output_shapes
: 
¶
ч
@__inference_dense_layer_call_and_return_conditional_losses_16453

inputs3
!tensordot_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identityИҐBiasAdd/ReadVariableOpҐTensordot/ReadVariableOpz
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ї
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : њ
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Ь
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:z
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» К
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€К
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ [
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : І
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Д
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» U
ReluReluBiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€» f
IdentityIdentityRelu:activations:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€» : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
ѕ
щ
B__inference_dense_1_layer_call_and_return_conditional_losses_18838

inputs3
!tensordot_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identityИҐBiasAdd/ReadVariableOpҐTensordot/ReadVariableOpz
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ї
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : њ
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Ь
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:z
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» К
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€К
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ [
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : І
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Д
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» d
IdentityIdentityBiasAdd:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€» : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
С
£
E__inference_sequential_layer_call_and_return_conditional_losses_16594
dense_input
dense_16583:  
dense_16585: 
dense_1_16588:  
dense_1_16590: 
identityИҐdense/StatefulPartitionedCallҐdense_1/StatefulPartitionedCallо
dense/StatefulPartitionedCallStatefulPartitionedCalldense_inputdense_16583dense_16585*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_16453С
dense_1/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0dense_1_16588dense_1_16590*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_16489|
IdentityIdentity(dense_1/StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» И
NoOpNoOp^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :€€€€€€€€€» : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall:Y U
,
_output_shapes
:€€€€€€€€€» 
%
_user_specified_namedense_input
…
N
"__inference__update_step_xla_18085
gradient
variable:  *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*(
_input_shapes
:€€€€€€€€€ : *
	_noinline(:Q M
'
_output_shapes
:€€€€€€€€€ 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
ЬЦ
Ш
@__inference_model_layer_call_and_return_conditional_losses_17834

inputsR
?token_and_position_embedding_embedding_1_embedding_lookup_17681:	» Q
=token_and_position_embedding_embedding_embedding_lookup_17686:
†Ь h
Rtransformer_block_multi_head_attention_query_einsum_einsum_readvariableop_resource:  Z
Htransformer_block_multi_head_attention_query_add_readvariableop_resource: f
Ptransformer_block_multi_head_attention_key_einsum_einsum_readvariableop_resource:  X
Ftransformer_block_multi_head_attention_key_add_readvariableop_resource: h
Rtransformer_block_multi_head_attention_value_einsum_einsum_readvariableop_resource:  Z
Htransformer_block_multi_head_attention_value_add_readvariableop_resource: s
]transformer_block_multi_head_attention_attention_output_einsum_einsum_readvariableop_resource:  a
Stransformer_block_multi_head_attention_attention_output_add_readvariableop_resource: Y
Ktransformer_block_layer_normalization_batchnorm_mul_readvariableop_resource: U
Gtransformer_block_layer_normalization_batchnorm_readvariableop_resource: V
Dtransformer_block_sequential_dense_tensordot_readvariableop_resource:  P
Btransformer_block_sequential_dense_biasadd_readvariableop_resource: X
Ftransformer_block_sequential_dense_1_tensordot_readvariableop_resource:  R
Dtransformer_block_sequential_dense_1_biasadd_readvariableop_resource: [
Mtransformer_block_layer_normalization_1_batchnorm_mul_readvariableop_resource: W
Itransformer_block_layer_normalization_1_batchnorm_readvariableop_resource: 8
&dense_2_matmul_readvariableop_resource: 5
'dense_2_biasadd_readvariableop_resource:8
&dense_3_matmul_readvariableop_resource:5
'dense_3_biasadd_readvariableop_resource:
identityИҐdense_2/BiasAdd/ReadVariableOpҐdense_2/MatMul/ReadVariableOpҐdense_3/BiasAdd/ReadVariableOpҐdense_3/MatMul/ReadVariableOpҐ7token_and_position_embedding/embedding/embedding_lookupҐ9token_and_position_embedding/embedding_1/embedding_lookupҐ>transformer_block/layer_normalization/batchnorm/ReadVariableOpҐBtransformer_block/layer_normalization/batchnorm/mul/ReadVariableOpҐ@transformer_block/layer_normalization_1/batchnorm/ReadVariableOpҐDtransformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOpҐJtransformer_block/multi_head_attention/attention_output/add/ReadVariableOpҐTtransformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpҐ=transformer_block/multi_head_attention/key/add/ReadVariableOpҐGtransformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOpҐ?transformer_block/multi_head_attention/query/add/ReadVariableOpҐItransformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOpҐ?transformer_block/multi_head_attention/value/add/ReadVariableOpҐItransformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOpҐ9transformer_block/sequential/dense/BiasAdd/ReadVariableOpҐ;transformer_block/sequential/dense/Tensordot/ReadVariableOpҐ;transformer_block/sequential/dense_1/BiasAdd/ReadVariableOpҐ=transformer_block/sequential/dense_1/Tensordot/ReadVariableOpX
"token_and_position_embedding/ShapeShapeinputs*
T0*
_output_shapes
:Г
0token_and_position_embedding/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
€€€€€€€€€|
2token_and_position_embedding/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: |
2token_and_position_embedding/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:в
*token_and_position_embedding/strided_sliceStridedSlice+token_and_position_embedding/Shape:output:09token_and_position_embedding/strided_slice/stack:output:0;token_and_position_embedding/strided_slice/stack_1:output:0;token_and_position_embedding/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskj
(token_and_position_embedding/range/startConst*
_output_shapes
: *
dtype0*
value	B : j
(token_and_position_embedding/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :г
"token_and_position_embedding/rangeRange1token_and_position_embedding/range/start:output:03token_and_position_embedding/strided_slice:output:01token_and_position_embedding/range/delta:output:0*
_output_shapes	
:»Ћ
9token_and_position_embedding/embedding_1/embedding_lookupResourceGather?token_and_position_embedding_embedding_1_embedding_lookup_17681+token_and_position_embedding/range:output:0*
Tindices0*R
_classH
FDloc:@token_and_position_embedding/embedding_1/embedding_lookup/17681*
_output_shapes
:	» *
dtype0Р
Btoken_and_position_embedding/embedding_1/embedding_lookup/IdentityIdentityBtoken_and_position_embedding/embedding_1/embedding_lookup:output:0*
T0*R
_classH
FDloc:@token_and_position_embedding/embedding_1/embedding_lookup/17681*
_output_shapes
:	» «
Dtoken_and_position_embedding/embedding_1/embedding_lookup/Identity_1IdentityKtoken_and_position_embedding/embedding_1/embedding_lookup/Identity:output:0*
T0*
_output_shapes
:	» ≠
7token_and_position_embedding/embedding/embedding_lookupResourceGather=token_and_position_embedding_embedding_embedding_lookup_17686inputs*
Tindices0*P
_classF
DBloc:@token_and_position_embedding/embedding/embedding_lookup/17686*,
_output_shapes
:€€€€€€€€€» *
dtype0Ч
@token_and_position_embedding/embedding/embedding_lookup/IdentityIdentity@token_and_position_embedding/embedding/embedding_lookup:output:0*
T0*P
_classF
DBloc:@token_and_position_embedding/embedding/embedding_lookup/17686*,
_output_shapes
:€€€€€€€€€» –
Btoken_and_position_embedding/embedding/embedding_lookup/Identity_1IdentityItoken_and_position_embedding/embedding/embedding_lookup/Identity:output:0*
T0*,
_output_shapes
:€€€€€€€€€» ь
 token_and_position_embedding/addAddV2Ktoken_and_position_embedding/embedding/embedding_lookup/Identity_1:output:0Mtoken_and_position_embedding/embedding_1/embedding_lookup/Identity_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» а
Itransformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOpRtransformer_block_multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Ю
:transformer_block/multi_head_attention/query/einsum/EinsumEinsum$token_and_position_embedding/add:z:0Qtransformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde»
?transformer_block/multi_head_attention/query/add/ReadVariableOpReadVariableOpHtransformer_block_multi_head_attention_query_add_readvariableop_resource*
_output_shapes

: *
dtype0В
0transformer_block/multi_head_attention/query/addAddV2Ctransformer_block/multi_head_attention/query/einsum/Einsum:output:0Gtransformer_block/multi_head_attention/query/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» №
Gtransformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOpPtransformer_block_multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Ъ
8transformer_block/multi_head_attention/key/einsum/EinsumEinsum$token_and_position_embedding/add:z:0Otransformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abdeƒ
=transformer_block/multi_head_attention/key/add/ReadVariableOpReadVariableOpFtransformer_block_multi_head_attention_key_add_readvariableop_resource*
_output_shapes

: *
dtype0ь
.transformer_block/multi_head_attention/key/addAddV2Atransformer_block/multi_head_attention/key/einsum/Einsum:output:0Etransformer_block/multi_head_attention/key/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» а
Itransformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOpRtransformer_block_multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Ю
:transformer_block/multi_head_attention/value/einsum/EinsumEinsum$token_and_position_embedding/add:z:0Qtransformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationabc,cde->abde»
?transformer_block/multi_head_attention/value/add/ReadVariableOpReadVariableOpHtransformer_block_multi_head_attention_value_add_readvariableop_resource*
_output_shapes

: *
dtype0В
0transformer_block/multi_head_attention/value/addAddV2Ctransformer_block/multi_head_attention/value/einsum/Einsum:output:0Gtransformer_block/multi_head_attention/value/add/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€» q
,transformer_block/multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *у5>ў
*transformer_block/multi_head_attention/MulMul4transformer_block/multi_head_attention/query/add:z:05transformer_block/multi_head_attention/Mul/y:output:0*
T0*0
_output_shapes
:€€€€€€€€€» Ж
4transformer_block/multi_head_attention/einsum/EinsumEinsum2transformer_block/multi_head_attention/key/add:z:0.transformer_block/multi_head_attention/Mul:z:0*
N*
T0*1
_output_shapes
:€€€€€€€€€»»*
equationaecd,abcd->acbeЉ
6transformer_block/multi_head_attention/softmax/SoftmaxSoftmax=transformer_block/multi_head_attention/einsum/Einsum:output:0*
T0*1
_output_shapes
:€€€€€€€€€»»Ѕ
7transformer_block/multi_head_attention/dropout/IdentityIdentity@transformer_block/multi_head_attention/softmax/Softmax:softmax:0*
T0*1
_output_shapes
:€€€€€€€€€»»Ы
6transformer_block/multi_head_attention/einsum_1/EinsumEinsum@transformer_block/multi_head_attention/dropout/Identity:output:04transformer_block/multi_head_attention/value/add:z:0*
N*
T0*0
_output_shapes
:€€€€€€€€€» *
equationacbe,aecd->abcdц
Ttransformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOp]transformer_block_multi_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:  *
dtype0Ћ
Etransformer_block/multi_head_attention/attention_output/einsum/EinsumEinsum?transformer_block/multi_head_attention/einsum_1/Einsum:output:0\transformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*,
_output_shapes
:€€€€€€€€€» *
equationabcd,cde->abeЏ
Jtransformer_block/multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpStransformer_block_multi_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
: *
dtype0Я
;transformer_block/multi_head_attention/attention_output/addAddV2Ntransformer_block/multi_head_attention/attention_output/einsum/Einsum:output:0Rtransformer_block/multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» ¶
"transformer_block/dropout/IdentityIdentity?transformer_block/multi_head_attention/attention_output/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ®
transformer_block/addAddV2$token_and_position_embedding/add:z:0+transformer_block/dropout/Identity:output:0*
T0*,
_output_shapes
:€€€€€€€€€» О
Dtransformer_block/layer_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:м
2transformer_block/layer_normalization/moments/meanMeantransformer_block/add:z:0Mtransformer_block/layer_normalization/moments/mean/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(Њ
:transformer_block/layer_normalization/moments/StopGradientStopGradient;transformer_block/layer_normalization/moments/mean:output:0*
T0*,
_output_shapes
:€€€€€€€€€»л
?transformer_block/layer_normalization/moments/SquaredDifferenceSquaredDifferencetransformer_block/add:z:0Ctransformer_block/layer_normalization/moments/StopGradient:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Т
Htransformer_block/layer_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:Ю
6transformer_block/layer_normalization/moments/varianceMeanCtransformer_block/layer_normalization/moments/SquaredDifference:z:0Qtransformer_block/layer_normalization/moments/variance/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(z
5transformer_block/layer_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *љ7Ж5ф
3transformer_block/layer_normalization/batchnorm/addAddV2?transformer_block/layer_normalization/moments/variance:output:0>transformer_block/layer_normalization/batchnorm/add/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€»Ѓ
5transformer_block/layer_normalization/batchnorm/RsqrtRsqrt7transformer_block/layer_normalization/batchnorm/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€» 
Btransformer_block/layer_normalization/batchnorm/mul/ReadVariableOpReadVariableOpKtransformer_block_layer_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0ш
3transformer_block/layer_normalization/batchnorm/mulMul9transformer_block/layer_normalization/batchnorm/Rsqrt:y:0Jtransformer_block/layer_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» «
5transformer_block/layer_normalization/batchnorm/mul_1Multransformer_block/add:z:07transformer_block/layer_normalization/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» й
5transformer_block/layer_normalization/batchnorm/mul_2Mul;transformer_block/layer_normalization/moments/mean:output:07transformer_block/layer_normalization/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ¬
>transformer_block/layer_normalization/batchnorm/ReadVariableOpReadVariableOpGtransformer_block_layer_normalization_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0ф
3transformer_block/layer_normalization/batchnorm/subSubFtransformer_block/layer_normalization/batchnorm/ReadVariableOp:value:09transformer_block/layer_normalization/batchnorm/mul_2:z:0*
T0*,
_output_shapes
:€€€€€€€€€» й
5transformer_block/layer_normalization/batchnorm/add_1AddV29transformer_block/layer_normalization/batchnorm/mul_1:z:07transformer_block/layer_normalization/batchnorm/sub:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ј
;transformer_block/sequential/dense/Tensordot/ReadVariableOpReadVariableOpDtransformer_block_sequential_dense_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0{
1transformer_block/sequential/dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:В
1transformer_block/sequential/dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Ы
2transformer_block/sequential/dense/Tensordot/ShapeShape9transformer_block/layer_normalization/batchnorm/add_1:z:0*
T0*
_output_shapes
:|
:transformer_block/sequential/dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : «
5transformer_block/sequential/dense/Tensordot/GatherV2GatherV2;transformer_block/sequential/dense/Tensordot/Shape:output:0:transformer_block/sequential/dense/Tensordot/free:output:0Ctransformer_block/sequential/dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:~
<transformer_block/sequential/dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ћ
7transformer_block/sequential/dense/Tensordot/GatherV2_1GatherV2;transformer_block/sequential/dense/Tensordot/Shape:output:0:transformer_block/sequential/dense/Tensordot/axes:output:0Etransformer_block/sequential/dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:|
2transformer_block/sequential/dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: „
1transformer_block/sequential/dense/Tensordot/ProdProd>transformer_block/sequential/dense/Tensordot/GatherV2:output:0;transformer_block/sequential/dense/Tensordot/Const:output:0*
T0*
_output_shapes
: ~
4transformer_block/sequential/dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: Ё
3transformer_block/sequential/dense/Tensordot/Prod_1Prod@transformer_block/sequential/dense/Tensordot/GatherV2_1:output:0=transformer_block/sequential/dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: z
8transformer_block/sequential/dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ®
3transformer_block/sequential/dense/Tensordot/concatConcatV2:transformer_block/sequential/dense/Tensordot/free:output:0:transformer_block/sequential/dense/Tensordot/axes:output:0Atransformer_block/sequential/dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:в
2transformer_block/sequential/dense/Tensordot/stackPack:transformer_block/sequential/dense/Tensordot/Prod:output:0<transformer_block/sequential/dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:у
6transformer_block/sequential/dense/Tensordot/transpose	Transpose9transformer_block/layer_normalization/batchnorm/add_1:z:0<transformer_block/sequential/dense/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» у
4transformer_block/sequential/dense/Tensordot/ReshapeReshape:transformer_block/sequential/dense/Tensordot/transpose:y:0;transformer_block/sequential/dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€у
3transformer_block/sequential/dense/Tensordot/MatMulMatMul=transformer_block/sequential/dense/Tensordot/Reshape:output:0Ctransformer_block/sequential/dense/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ ~
4transformer_block/sequential/dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: |
:transformer_block/sequential/dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ≥
5transformer_block/sequential/dense/Tensordot/concat_1ConcatV2>transformer_block/sequential/dense/Tensordot/GatherV2:output:0=transformer_block/sequential/dense/Tensordot/Const_2:output:0Ctransformer_block/sequential/dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:н
,transformer_block/sequential/dense/TensordotReshape=transformer_block/sequential/dense/Tensordot/MatMul:product:0>transformer_block/sequential/dense/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Є
9transformer_block/sequential/dense/BiasAdd/ReadVariableOpReadVariableOpBtransformer_block_sequential_dense_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0ж
*transformer_block/sequential/dense/BiasAddBiasAdd5transformer_block/sequential/dense/Tensordot:output:0Atransformer_block/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» Ы
'transformer_block/sequential/dense/ReluRelu3transformer_block/sequential/dense/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€» ƒ
=transformer_block/sequential/dense_1/Tensordot/ReadVariableOpReadVariableOpFtransformer_block_sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes

:  *
dtype0}
3transformer_block/sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:Д
3transformer_block/sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Щ
4transformer_block/sequential/dense_1/Tensordot/ShapeShape5transformer_block/sequential/dense/Relu:activations:0*
T0*
_output_shapes
:~
<transformer_block/sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ѕ
7transformer_block/sequential/dense_1/Tensordot/GatherV2GatherV2=transformer_block/sequential/dense_1/Tensordot/Shape:output:0<transformer_block/sequential/dense_1/Tensordot/free:output:0Etransformer_block/sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:А
>transformer_block/sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ”
9transformer_block/sequential/dense_1/Tensordot/GatherV2_1GatherV2=transformer_block/sequential/dense_1/Tensordot/Shape:output:0<transformer_block/sequential/dense_1/Tensordot/axes:output:0Gtransformer_block/sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:~
4transformer_block/sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: Ё
3transformer_block/sequential/dense_1/Tensordot/ProdProd@transformer_block/sequential/dense_1/Tensordot/GatherV2:output:0=transformer_block/sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: А
6transformer_block/sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: г
5transformer_block/sequential/dense_1/Tensordot/Prod_1ProdBtransformer_block/sequential/dense_1/Tensordot/GatherV2_1:output:0?transformer_block/sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: |
:transformer_block/sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ∞
5transformer_block/sequential/dense_1/Tensordot/concatConcatV2<transformer_block/sequential/dense_1/Tensordot/free:output:0<transformer_block/sequential/dense_1/Tensordot/axes:output:0Ctransformer_block/sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:и
4transformer_block/sequential/dense_1/Tensordot/stackPack<transformer_block/sequential/dense_1/Tensordot/Prod:output:0>transformer_block/sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:у
8transformer_block/sequential/dense_1/Tensordot/transpose	Transpose5transformer_block/sequential/dense/Relu:activations:0>transformer_block/sequential/dense_1/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€» щ
6transformer_block/sequential/dense_1/Tensordot/ReshapeReshape<transformer_block/sequential/dense_1/Tensordot/transpose:y:0=transformer_block/sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€щ
5transformer_block/sequential/dense_1/Tensordot/MatMulMatMul?transformer_block/sequential/dense_1/Tensordot/Reshape:output:0Etransformer_block/sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ А
6transformer_block/sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB: ~
<transformer_block/sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ї
7transformer_block/sequential/dense_1/Tensordot/concat_1ConcatV2@transformer_block/sequential/dense_1/Tensordot/GatherV2:output:0?transformer_block/sequential/dense_1/Tensordot/Const_2:output:0Etransformer_block/sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:у
.transformer_block/sequential/dense_1/TensordotReshape?transformer_block/sequential/dense_1/Tensordot/MatMul:product:0@transformer_block/sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Љ
;transformer_block/sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOpDtransformer_block_sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0м
,transformer_block/sequential/dense_1/BiasAddBiasAdd7transformer_block/sequential/dense_1/Tensordot:output:0Ctransformer_block/sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» Ю
$transformer_block/dropout_1/IdentityIdentity5transformer_block/sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ѕ
transformer_block/add_1AddV29transformer_block/layer_normalization/batchnorm/add_1:z:0-transformer_block/dropout_1/Identity:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Р
Ftransformer_block/layer_normalization_1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:т
4transformer_block/layer_normalization_1/moments/meanMeantransformer_block/add_1:z:0Otransformer_block/layer_normalization_1/moments/mean/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(¬
<transformer_block/layer_normalization_1/moments/StopGradientStopGradient=transformer_block/layer_normalization_1/moments/mean:output:0*
T0*,
_output_shapes
:€€€€€€€€€»с
Atransformer_block/layer_normalization_1/moments/SquaredDifferenceSquaredDifferencetransformer_block/add_1:z:0Etransformer_block/layer_normalization_1/moments/StopGradient:output:0*
T0*,
_output_shapes
:€€€€€€€€€» Ф
Jtransformer_block/layer_normalization_1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:§
8transformer_block/layer_normalization_1/moments/varianceMeanEtransformer_block/layer_normalization_1/moments/SquaredDifference:z:0Stransformer_block/layer_normalization_1/moments/variance/reduction_indices:output:0*
T0*,
_output_shapes
:€€€€€€€€€»*
	keep_dims(|
7transformer_block/layer_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *љ7Ж5ъ
5transformer_block/layer_normalization_1/batchnorm/addAddV2Atransformer_block/layer_normalization_1/moments/variance:output:0@transformer_block/layer_normalization_1/batchnorm/add/y:output:0*
T0*,
_output_shapes
:€€€€€€€€€»≤
7transformer_block/layer_normalization_1/batchnorm/RsqrtRsqrt9transformer_block/layer_normalization_1/batchnorm/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€»ќ
Dtransformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOpMtransformer_block_layer_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0ю
5transformer_block/layer_normalization_1/batchnorm/mulMul;transformer_block/layer_normalization_1/batchnorm/Rsqrt:y:0Ltransformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€» Ќ
7transformer_block/layer_normalization_1/batchnorm/mul_1Multransformer_block/add_1:z:09transformer_block/layer_normalization_1/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» п
7transformer_block/layer_normalization_1/batchnorm/mul_2Mul=transformer_block/layer_normalization_1/moments/mean:output:09transformer_block/layer_normalization_1/batchnorm/mul:z:0*
T0*,
_output_shapes
:€€€€€€€€€» ∆
@transformer_block/layer_normalization_1/batchnorm/ReadVariableOpReadVariableOpItransformer_block_layer_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0ъ
5transformer_block/layer_normalization_1/batchnorm/subSubHtransformer_block/layer_normalization_1/batchnorm/ReadVariableOp:value:0;transformer_block/layer_normalization_1/batchnorm/mul_2:z:0*
T0*,
_output_shapes
:€€€€€€€€€» п
7transformer_block/layer_normalization_1/batchnorm/add_1AddV2;transformer_block/layer_normalization_1/batchnorm/mul_1:z:09transformer_block/layer_normalization_1/batchnorm/sub:z:0*
T0*,
_output_shapes
:€€€€€€€€€» q
/global_average_pooling1d/Mean/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :ќ
global_average_pooling1d/MeanMean;transformer_block/layer_normalization_1/batchnorm/add_1:z:08global_average_pooling1d/Mean/reduction_indices:output:0*
T0*'
_output_shapes
:€€€€€€€€€ x
dropout_2/IdentityIdentity&global_average_pooling1d/Mean:output:0*
T0*'
_output_shapes
:€€€€€€€€€ Д
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource*
_output_shapes

: *
dtype0О
dense_2/MatMulMatMuldropout_2/Identity:output:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€В
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0О
dense_2/BiasAddBiasAdddense_2/MatMul:product:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€`
dense_2/ReluReludense_2/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€l
dropout_3/IdentityIdentitydense_2/Relu:activations:0*
T0*'
_output_shapes
:€€€€€€€€€Д
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource*
_output_shapes

:*
dtype0О
dense_3/MatMulMatMuldropout_3/Identity:output:0%dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€В
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0О
dense_3/BiasAddBiasAdddense_3/MatMul:product:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€f
dense_3/SoftmaxSoftmaxdense_3/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€h
IdentityIdentitydense_3/Softmax:softmax:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€Р
NoOpNoOp^dense_2/BiasAdd/ReadVariableOp^dense_2/MatMul/ReadVariableOp^dense_3/BiasAdd/ReadVariableOp^dense_3/MatMul/ReadVariableOp8^token_and_position_embedding/embedding/embedding_lookup:^token_and_position_embedding/embedding_1/embedding_lookup?^transformer_block/layer_normalization/batchnorm/ReadVariableOpC^transformer_block/layer_normalization/batchnorm/mul/ReadVariableOpA^transformer_block/layer_normalization_1/batchnorm/ReadVariableOpE^transformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOpK^transformer_block/multi_head_attention/attention_output/add/ReadVariableOpU^transformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp>^transformer_block/multi_head_attention/key/add/ReadVariableOpH^transformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOp@^transformer_block/multi_head_attention/query/add/ReadVariableOpJ^transformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOp@^transformer_block/multi_head_attention/value/add/ReadVariableOpJ^transformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOp:^transformer_block/sequential/dense/BiasAdd/ReadVariableOp<^transformer_block/sequential/dense/Tensordot/ReadVariableOp<^transformer_block/sequential/dense_1/BiasAdd/ReadVariableOp>^transformer_block/sequential/dense_1/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:€€€€€€€€€»: : : : : : : : : : : : : : : : : : : : : : 2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp2r
7token_and_position_embedding/embedding/embedding_lookup7token_and_position_embedding/embedding/embedding_lookup2v
9token_and_position_embedding/embedding_1/embedding_lookup9token_and_position_embedding/embedding_1/embedding_lookup2А
>transformer_block/layer_normalization/batchnorm/ReadVariableOp>transformer_block/layer_normalization/batchnorm/ReadVariableOp2И
Btransformer_block/layer_normalization/batchnorm/mul/ReadVariableOpBtransformer_block/layer_normalization/batchnorm/mul/ReadVariableOp2Д
@transformer_block/layer_normalization_1/batchnorm/ReadVariableOp@transformer_block/layer_normalization_1/batchnorm/ReadVariableOp2М
Dtransformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOpDtransformer_block/layer_normalization_1/batchnorm/mul/ReadVariableOp2Ш
Jtransformer_block/multi_head_attention/attention_output/add/ReadVariableOpJtransformer_block/multi_head_attention/attention_output/add/ReadVariableOp2ђ
Ttransformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpTtransformer_block/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp2~
=transformer_block/multi_head_attention/key/add/ReadVariableOp=transformer_block/multi_head_attention/key/add/ReadVariableOp2Т
Gtransformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOpGtransformer_block/multi_head_attention/key/einsum/Einsum/ReadVariableOp2В
?transformer_block/multi_head_attention/query/add/ReadVariableOp?transformer_block/multi_head_attention/query/add/ReadVariableOp2Ц
Itransformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOpItransformer_block/multi_head_attention/query/einsum/Einsum/ReadVariableOp2В
?transformer_block/multi_head_attention/value/add/ReadVariableOp?transformer_block/multi_head_attention/value/add/ReadVariableOp2Ц
Itransformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOpItransformer_block/multi_head_attention/value/einsum/Einsum/ReadVariableOp2v
9transformer_block/sequential/dense/BiasAdd/ReadVariableOp9transformer_block/sequential/dense/BiasAdd/ReadVariableOp2z
;transformer_block/sequential/dense/Tensordot/ReadVariableOp;transformer_block/sequential/dense/Tensordot/ReadVariableOp2z
;transformer_block/sequential/dense_1/BiasAdd/ReadVariableOp;transformer_block/sequential/dense_1/BiasAdd/ReadVariableOp2~
=transformer_block/sequential/dense_1/Tensordot/ReadVariableOp=transformer_block/sequential/dense_1/Tensordot/ReadVariableOp:P L
(
_output_shapes
:€€€€€€€€€»
 
_user_specified_nameinputs
Њ
“
*__inference_sequential_layer_call_fn_16580
dense_input
unknown:  
	unknown_0: 
	unknown_1:  
	unknown_2: 
identityИҐStatefulPartitionedCallБ
StatefulPartitionedCallStatefulPartitionedCalldense_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_16556t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :€€€€€€€€€» : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
,
_output_shapes
:€€€€€€€€€» 
%
_user_specified_namedense_input
ї
’
%__inference_model_layer_call_fn_16915
input_1
unknown:	» 
	unknown_0:
†Ь 
	unknown_1:  
	unknown_2: 
	unknown_3:  
	unknown_4: 
	unknown_5:  
	unknown_6: 
	unknown_7:  
	unknown_8: 
	unknown_9: 

unknown_10: 

unknown_11:  

unknown_12: 

unknown_13:  

unknown_14: 

unknown_15: 

unknown_16: 

unknown_17: 

unknown_18:

unknown_19:

unknown_20:
identityИҐStatefulPartitionedCallи
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20*"
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*8
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_model_layer_call_and_return_conditional_losses_16868o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:€€€€€€€€€»: : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:€€€€€€€€€»
!
_user_specified_name	input_1
С
£
E__inference_sequential_layer_call_and_return_conditional_losses_16608
dense_input
dense_16597:  
dense_16599: 
dense_1_16602:  
dense_1_16604: 
identityИҐdense/StatefulPartitionedCallҐdense_1/StatefulPartitionedCallо
dense/StatefulPartitionedCallStatefulPartitionedCalldense_inputdense_16597dense_16599*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_16453С
dense_1/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0dense_1_16602dense_1_16604*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_16489|
IdentityIdentity(dense_1/StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» И
NoOpNoOp^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :€€€€€€€€€» : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall:Y U
,
_output_shapes
:€€€€€€€€€» 
%
_user_specified_namedense_input
„
b
D__inference_dropout_3_layer_call_and_return_conditional_losses_16848

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:€€€€€€€€€[

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:€€€€€€€€€"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
„
b
D__inference_dropout_2_layer_call_and_return_conditional_losses_18540

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:€€€€€€€€€ [

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:€€€€€€€€€ "!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€ :O K
'
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
—
Т
%__inference_dense_layer_call_fn_18768

inputs
unknown:  
	unknown_0: 
identityИҐStatefulPartitionedCallЁ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_16453t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€» : : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs
Ѕ
Ф
'__inference_dense_3_layer_call_fn_18608

inputs
unknown:
	unknown_0:
identityИҐStatefulPartitionedCallЏ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_16861o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
т
b
)__inference_dropout_2_layer_call_fn_18535

inputs
identityИҐStatefulPartitionedCall¬
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_16978o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€ `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€ 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
√
R
"__inference__update_step_xla_18075
gradient
variable:  *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*#
_input_shapes
:  : *
	_noinline(:L H
"
_output_shapes
:  
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Щ

у
B__inference_dense_2_layer_call_and_return_conditional_losses_16837

inputs0
matmul_readvariableop_resource: -
biasadd_readvariableop_resource:
identityИҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: *
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€ : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
†
E
)__inference_dropout_3_layer_call_fn_18577

inputs
identity≤
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_16848`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Ђ
J
"__inference__update_step_xla_18115
gradient
variable: *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

: : *
	_noinline(:D @

_output_shapes
: 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Х
p
"__inference__update_step_xla_18033
gradient

gradient_1

gradient_2
variable:
†Ь *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*=
_input_shapes,
*:€€€€€€€€€ :€€€€€€€€€:: *
	_noinline(:Q M
'
_output_shapes
:€€€€€€€€€ 
"
_user_specified_name
gradient:MI
#
_output_shapes
:€€€€€€€€€
"
_user_specified_name
gradient:D@

_output_shapes
:
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
Ю

у
B__inference_dense_3_layer_call_and_return_conditional_losses_18619

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identityИҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€V
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€`
IdentityIdentitySoftmax:softmax:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Ђ
J
"__inference__update_step_xla_18120
gradient
variable: *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

: : *
	_noinline(:D @

_output_shapes
: 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
ѓ
Ќ
*__inference_sequential_layer_call_fn_18645

inputs
unknown:  
	unknown_0: 
	unknown_1:  
	unknown_2: 
identityИҐStatefulPartitionedCallь
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€» *&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_16556t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€» `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :€€€€€€€€€» : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:€€€€€€€€€» 
 
_user_specified_nameinputs"Ж
L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*Ђ
serving_defaultЧ
<
input_11
serving_default_input_1:0€€€€€€€€€»;
dense_30
StatefulPartitionedCall:0€€€€€€€€€tensorflow/serving/predict:ИО
≥
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer-3
layer-4
layer_with_weights-2
layer-5
layer-6
layer_with_weights-3
layer-7
		variables

trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures"
_tf_keras_network
"
_tf_keras_input_layer
Ѕ
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
	token_emb
pos_emb"
_tf_keras_layer
у
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
 att
!ffn
"
layernorm1
#
layernorm2
$dropout1
%dropout2"
_tf_keras_layer
•
&	variables
'trainable_variables
(regularization_losses
)	keras_api
*__call__
*+&call_and_return_all_conditional_losses"
_tf_keras_layer
Љ
,	variables
-trainable_variables
.regularization_losses
/	keras_api
0__call__
*1&call_and_return_all_conditional_losses
2_random_generator"
_tf_keras_layer
ї
3	variables
4trainable_variables
5regularization_losses
6	keras_api
7__call__
*8&call_and_return_all_conditional_losses

9kernel
:bias"
_tf_keras_layer
Љ
;	variables
<trainable_variables
=regularization_losses
>	keras_api
?__call__
*@&call_and_return_all_conditional_losses
A_random_generator"
_tf_keras_layer
ї
B	variables
Ctrainable_variables
Dregularization_losses
E	keras_api
F__call__
*G&call_and_return_all_conditional_losses

Hkernel
Ibias"
_tf_keras_layer
∆
J0
K1
L2
M3
N4
O5
P6
Q7
R8
S9
T10
U11
V12
W13
X14
Y15
Z16
[17
918
:19
H20
I21"
trackable_list_wrapper
∆
J0
K1
L2
M3
N4
O5
P6
Q7
R8
S9
T10
U11
V12
W13
X14
Y15
Z16
[17
918
:19
H20
I21"
trackable_list_wrapper
 "
trackable_list_wrapper
 
\non_trainable_variables

]layers
^metrics
_layer_regularization_losses
`layer_metrics
		variables

trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
…
atrace_0
btrace_1
ctrace_2
dtrace_32ё
%__inference_model_layer_call_fn_16915
%__inference_model_layer_call_fn_17621
%__inference_model_layer_call_fn_17670
%__inference_model_layer_call_fn_17409њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zatrace_0zbtrace_1zctrace_2zdtrace_3
µ
etrace_0
ftrace_1
gtrace_2
htrace_32 
@__inference_model_layer_call_and_return_conditional_losses_17834
@__inference_model_layer_call_and_return_conditional_losses_18026
@__inference_model_layer_call_and_return_conditional_losses_17464
@__inference_model_layer_call_and_return_conditional_losses_17519њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zetrace_0zftrace_1zgtrace_2zhtrace_3
ЋB»
 __inference__wrapped_model_16415input_1"Ш
С≤Н
FullArgSpec
argsЪ 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
Ь
i
_variables
j_iterations
k_learning_rate
l_index_dict
m
_momentums
n_velocities
o_update_step_xla"
experimentalOptimizer
,
pserving_default"
signature_map
.
J0
K1"
trackable_list_wrapper
.
J0
K1"
trackable_list_wrapper
 "
trackable_list_wrapper
≠
qnon_trainable_variables

rlayers
smetrics
tlayer_regularization_losses
ulayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
ы
vtrace_02ё
<__inference_token_and_position_embedding_layer_call_fn_18149Э
Ф≤Р
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zvtrace_0
Ц
wtrace_02щ
W__inference_token_and_position_embedding_layer_call_and_return_conditional_losses_18172Э
Ф≤Р
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zwtrace_0
µ
x	variables
ytrainable_variables
zregularization_losses
{	keras_api
|__call__
*}&call_and_return_all_conditional_losses
J
embeddings"
_tf_keras_layer
є
~	variables
trainable_variables
Аregularization_losses
Б	keras_api
В__call__
+Г&call_and_return_all_conditional_losses
K
embeddings"
_tf_keras_layer
Ц
L0
M1
N2
O3
P4
Q5
R6
S7
T8
U9
V10
W11
X12
Y13
Z14
[15"
trackable_list_wrapper
Ц
L0
M1
N2
O3
P4
Q5
R6
S7
T8
U9
V10
W11
X12
Y13
Z14
[15"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
Дnon_trainable_variables
Еlayers
Жmetrics
 Зlayer_regularization_losses
Иlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
“
Йtrace_0
Кtrace_12Ч
1__inference_transformer_block_layer_call_fn_18209
1__inference_transformer_block_layer_call_fn_18246Ѓ
•≤°
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЙtrace_0zКtrace_1
И
Лtrace_0
Мtrace_12Ќ
L__inference_transformer_block_layer_call_and_return_conditional_losses_18373
L__inference_transformer_block_layer_call_and_return_conditional_losses_18514Ѓ
•≤°
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЛtrace_0zМtrace_1
Ъ
Н	variables
Оtrainable_variables
Пregularization_losses
Р	keras_api
С__call__
+Т&call_and_return_all_conditional_losses
У_query_dense
Ф
_key_dense
Х_value_dense
Ц_softmax
Ч_dropout_layer
Ш_output_dense"
_tf_keras_layer
В
Щlayer_with_weights-0
Щlayer-0
Ъlayer_with_weights-1
Ъlayer-1
Ы	variables
Ьtrainable_variables
Эregularization_losses
Ю	keras_api
Я__call__
+†&call_and_return_all_conditional_losses"
_tf_keras_sequential
Ћ
°	variables
Ґtrainable_variables
£regularization_losses
§	keras_api
•__call__
+¶&call_and_return_all_conditional_losses
	Іaxis
	Xgamma
Ybeta"
_tf_keras_layer
Ћ
®	variables
©trainable_variables
™regularization_losses
Ђ	keras_api
ђ__call__
+≠&call_and_return_all_conditional_losses
	Ѓaxis
	Zgamma
[beta"
_tf_keras_layer
√
ѓ	variables
∞trainable_variables
±regularization_losses
≤	keras_api
≥__call__
+і&call_and_return_all_conditional_losses
µ_random_generator"
_tf_keras_layer
√
ґ	variables
Јtrainable_variables
Єregularization_losses
є	keras_api
Ї__call__
+ї&call_and_return_all_conditional_losses
Љ_random_generator"
_tf_keras_layer
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≤
љnon_trainable_variables
Њlayers
њmetrics
 јlayer_regularization_losses
Ѕlayer_metrics
&	variables
'trainable_variables
(regularization_losses
*__call__
*+&call_and_return_all_conditional_losses
&+"call_and_return_conditional_losses"
_generic_user_object
Л
¬trace_02м
8__inference_global_average_pooling1d_layer_call_fn_18519ѓ
¶≤Ґ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z¬trace_0
¶
√trace_02З
S__inference_global_average_pooling1d_layer_call_and_return_conditional_losses_18525ѓ
¶≤Ґ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z√trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≤
ƒnon_trainable_variables
≈layers
∆metrics
 «layer_regularization_losses
»layer_metrics
,	variables
-trainable_variables
.regularization_losses
0__call__
*1&call_and_return_all_conditional_losses
&1"call_and_return_conditional_losses"
_generic_user_object
«
…trace_0
 trace_12М
)__inference_dropout_2_layer_call_fn_18530
)__inference_dropout_2_layer_call_fn_18535≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z…trace_0z trace_1
э
Ћtrace_0
ћtrace_12¬
D__inference_dropout_2_layer_call_and_return_conditional_losses_18540
D__inference_dropout_2_layer_call_and_return_conditional_losses_18552≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЋtrace_0zћtrace_1
"
_generic_user_object
.
90
:1"
trackable_list_wrapper
.
90
:1"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
Ќnon_trainable_variables
ќlayers
ѕmetrics
 –layer_regularization_losses
—layer_metrics
3	variables
4trainable_variables
5regularization_losses
7__call__
*8&call_and_return_all_conditional_losses
&8"call_and_return_conditional_losses"
_generic_user_object
н
“trace_02ќ
'__inference_dense_2_layer_call_fn_18561Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z“trace_0
И
”trace_02й
B__inference_dense_2_layer_call_and_return_conditional_losses_18572Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z”trace_0
 : 2dense_2/kernel
:2dense_2/bias
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≤
‘non_trainable_variables
’layers
÷metrics
 „layer_regularization_losses
Ўlayer_metrics
;	variables
<trainable_variables
=regularization_losses
?__call__
*@&call_and_return_all_conditional_losses
&@"call_and_return_conditional_losses"
_generic_user_object
«
ўtrace_0
Џtrace_12М
)__inference_dropout_3_layer_call_fn_18577
)__inference_dropout_3_layer_call_fn_18582≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zўtrace_0zЏtrace_1
э
џtrace_0
№trace_12¬
D__inference_dropout_3_layer_call_and_return_conditional_losses_18587
D__inference_dropout_3_layer_call_and_return_conditional_losses_18599≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zџtrace_0z№trace_1
"
_generic_user_object
.
H0
I1"
trackable_list_wrapper
.
H0
I1"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
Ёnon_trainable_variables
ёlayers
яmetrics
 аlayer_regularization_losses
бlayer_metrics
B	variables
Ctrainable_variables
Dregularization_losses
F__call__
*G&call_and_return_all_conditional_losses
&G"call_and_return_conditional_losses"
_generic_user_object
н
вtrace_02ќ
'__inference_dense_3_layer_call_fn_18608Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zвtrace_0
И
гtrace_02й
B__inference_dense_3_layer_call_and_return_conditional_losses_18619Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zгtrace_0
 :2dense_3/kernel
:2dense_3/bias
E:C
†Ь 21token_and_position_embedding/embedding/embeddings
F:D	» 23token_and_position_embedding/embedding_1/embeddings
I:G  23transformer_block/multi_head_attention/query/kernel
C:A 21transformer_block/multi_head_attention/query/bias
G:E  21transformer_block/multi_head_attention/key/kernel
A:? 2/transformer_block/multi_head_attention/key/bias
I:G  23transformer_block/multi_head_attention/value/kernel
C:A 21transformer_block/multi_head_attention/value/bias
T:R  2>transformer_block/multi_head_attention/attention_output/kernel
J:H 2<transformer_block/multi_head_attention/attention_output/bias
:  2dense/kernel
: 2
dense/bias
 :  2dense_1/kernel
: 2dense_1/bias
9:7 2+transformer_block/layer_normalization/gamma
8:6 2*transformer_block/layer_normalization/beta
;:9 2-transformer_block/layer_normalization_1/gamma
::8 2,transformer_block/layer_normalization_1/beta
 "
trackable_list_wrapper
X
0
1
2
3
4
5
6
7"
trackable_list_wrapper
0
д0
е1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
чBф
%__inference_model_layer_call_fn_16915input_1"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
%__inference_model_layer_call_fn_17621inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
%__inference_model_layer_call_fn_17670inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
%__inference_model_layer_call_fn_17409input_1"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
СBО
@__inference_model_layer_call_and_return_conditional_losses_17834inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
СBО
@__inference_model_layer_call_and_return_conditional_losses_18026inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ТBП
@__inference_model_layer_call_and_return_conditional_losses_17464input_1"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ТBП
@__inference_model_layer_call_and_return_conditional_losses_17519input_1"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
™
j0
ж1
з2
и3
й4
к5
л6
м7
н8
о9
п10
р11
с12
т13
у14
ф15
х16
ц17
ч18
ш19
щ20
ъ21
ы22
ь23
э24
ю25
€26
А27
Б28
В29
Г30
Д31
Е32
Ж33
З34
И35
Й36
К37
Л38
М39
Н40
О41
П42
Р43
С44"
trackable_list_wrapper
:	 2	iteration
: 2learning_rate
 "
trackable_dict_wrapper
№
ж0
и1
к2
м3
о4
р5
т6
ф7
ц8
ш9
ъ10
ь11
ю12
А13
В14
Д15
Ж16
И17
К18
М19
О20
Р21"
trackable_list_wrapper
№
з0
й1
л2
н3
п4
с5
у6
х7
ч8
щ9
ы10
э11
€12
Б13
Г14
Е15
З16
Й17
Л18
Н19
П20
С21"
trackable_list_wrapper
„
Тtrace_0
Уtrace_1
Фtrace_2
Хtrace_3
Цtrace_4
Чtrace_5
Шtrace_6
Щtrace_7
Ъtrace_8
Ыtrace_9
Ьtrace_10
Эtrace_11
Юtrace_12
Яtrace_13
†trace_14
°trace_15
Ґtrace_16
£trace_17
§trace_18
•trace_19
¶trace_20
Іtrace_212‘
"__inference__update_step_xla_18033
"__inference__update_step_xla_18040
"__inference__update_step_xla_18045
"__inference__update_step_xla_18050
"__inference__update_step_xla_18055
"__inference__update_step_xla_18060
"__inference__update_step_xla_18065
"__inference__update_step_xla_18070
"__inference__update_step_xla_18075
"__inference__update_step_xla_18080
"__inference__update_step_xla_18085
"__inference__update_step_xla_18090
"__inference__update_step_xla_18095
"__inference__update_step_xla_18100
"__inference__update_step_xla_18105
"__inference__update_step_xla_18110
"__inference__update_step_xla_18115
"__inference__update_step_xla_18120
"__inference__update_step_xla_18125
"__inference__update_step_xla_18130
"__inference__update_step_xla_18135
"__inference__update_step_xla_18140є
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 0zТtrace_0zУtrace_1zФtrace_2zХtrace_3zЦtrace_4zЧtrace_5zШtrace_6zЩtrace_7zЪtrace_8zЫtrace_9zЬtrace_10zЭtrace_11zЮtrace_12zЯtrace_13z†trace_14z°trace_15zҐtrace_16z£trace_17z§trace_18z•trace_19z¶trace_20zІtrace_21
 B«
#__inference_signature_wrapper_17572input_1"Ф
Н≤Й
FullArgSpec
argsЪ 
varargs
 
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
жBг
<__inference_token_and_position_embedding_layer_call_fn_18149x"Э
Ф≤Р
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
БBю
W__inference_token_and_position_embedding_layer_call_and_return_conditional_losses_18172x"Э
Ф≤Р
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
'
J0"
trackable_list_wrapper
'
J0"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
®non_trainable_variables
©layers
™metrics
 Ђlayer_regularization_losses
ђlayer_metrics
x	variables
ytrainable_variables
zregularization_losses
|__call__
*}&call_and_return_all_conditional_losses
&}"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
'
K0"
trackable_list_wrapper
'
K0"
trackable_list_wrapper
 "
trackable_list_wrapper
ґ
≠non_trainable_variables
Ѓlayers
ѓmetrics
 ∞layer_regularization_losses
±layer_metrics
~	variables
trainable_variables
Аregularization_losses
В__call__
+Г&call_and_return_all_conditional_losses
'Г"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
J
 0
!1
"2
#3
$4
%5"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
сBо
1__inference_transformer_block_layer_call_fn_18209inputs"Ѓ
•≤°
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
сBо
1__inference_transformer_block_layer_call_fn_18246inputs"Ѓ
•≤°
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
МBЙ
L__inference_transformer_block_layer_call_and_return_conditional_losses_18373inputs"Ѓ
•≤°
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
МBЙ
L__inference_transformer_block_layer_call_and_return_conditional_losses_18514inputs"Ѓ
•≤°
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
X
L0
M1
N2
O3
P4
Q5
R6
S7"
trackable_list_wrapper
X
L0
M1
N2
O3
P4
Q5
R6
S7"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
≤non_trainable_variables
≥layers
іmetrics
 µlayer_regularization_losses
ґlayer_metrics
Н	variables
Оtrainable_variables
Пregularization_losses
С__call__
+Т&call_and_return_all_conditional_losses
'Т"call_and_return_conditional_losses"
_generic_user_object
Ш2ХТ
Й≤Е
FullArgSpecx
argspЪm
jself
jquery
jvalue
jkey
jattention_mask
jreturn_attention_scores

jtraining
juse_causal_mask
varargs
 
varkw
 #
defaultsЪ

 

 
p 
p 
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
Ш2ХТ
Й≤Е
FullArgSpecx
argspЪm
jself
jquery
jvalue
jkey
jattention_mask
jreturn_attention_scores

jtraining
juse_causal_mask
varargs
 
varkw
 #
defaultsЪ

 

 
p 
p 
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ф
Ј	variables
Єtrainable_variables
єregularization_losses
Ї	keras_api
ї__call__
+Љ&call_and_return_all_conditional_losses
љpartial_output_shape
Њfull_output_shape

Lkernel
Mbias"
_tf_keras_layer
ф
њ	variables
јtrainable_variables
Ѕregularization_losses
¬	keras_api
√__call__
+ƒ&call_and_return_all_conditional_losses
≈partial_output_shape
∆full_output_shape

Nkernel
Obias"
_tf_keras_layer
ф
«	variables
»trainable_variables
…regularization_losses
 	keras_api
Ћ__call__
+ћ&call_and_return_all_conditional_losses
Ќpartial_output_shape
ќfull_output_shape

Pkernel
Qbias"
_tf_keras_layer
Ђ
ѕ	variables
–trainable_variables
—regularization_losses
“	keras_api
”__call__
+‘&call_and_return_all_conditional_losses"
_tf_keras_layer
√
’	variables
÷trainable_variables
„regularization_losses
Ў	keras_api
ў__call__
+Џ&call_and_return_all_conditional_losses
џ_random_generator"
_tf_keras_layer
ф
№	variables
Ёtrainable_variables
ёregularization_losses
я	keras_api
а__call__
+б&call_and_return_all_conditional_losses
вpartial_output_shape
гfull_output_shape

Rkernel
Sbias"
_tf_keras_layer
Ѕ
д	variables
еtrainable_variables
жregularization_losses
з	keras_api
и__call__
+й&call_and_return_all_conditional_losses

Tkernel
Ubias"
_tf_keras_layer
Ѕ
к	variables
лtrainable_variables
мregularization_losses
н	keras_api
о__call__
+п&call_and_return_all_conditional_losses

Vkernel
Wbias"
_tf_keras_layer
<
T0
U1
V2
W3"
trackable_list_wrapper
<
T0
U1
V2
W3"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
рnon_trainable_variables
сlayers
тmetrics
 уlayer_regularization_losses
фlayer_metrics
Ы	variables
Ьtrainable_variables
Эregularization_losses
Я__call__
+†&call_and_return_all_conditional_losses
'†"call_and_return_conditional_losses"
_generic_user_object
е
хtrace_0
цtrace_1
чtrace_2
шtrace_32т
*__inference_sequential_layer_call_fn_16507
*__inference_sequential_layer_call_fn_18632
*__inference_sequential_layer_call_fn_18645
*__inference_sequential_layer_call_fn_16580њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zхtrace_0zцtrace_1zчtrace_2zшtrace_3
—
щtrace_0
ъtrace_1
ыtrace_2
ьtrace_32ё
E__inference_sequential_layer_call_and_return_conditional_losses_18702
E__inference_sequential_layer_call_and_return_conditional_losses_18759
E__inference_sequential_layer_call_and_return_conditional_losses_16594
E__inference_sequential_layer_call_and_return_conditional_losses_16608њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zщtrace_0zъtrace_1zыtrace_2zьtrace_3
.
X0
Y1"
trackable_list_wrapper
.
X0
Y1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
эnon_trainable_variables
юlayers
€metrics
 Аlayer_regularization_losses
Бlayer_metrics
°	variables
Ґtrainable_variables
£regularization_losses
•__call__
+¶&call_and_return_all_conditional_losses
'¶"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
.
Z0
[1"
trackable_list_wrapper
.
Z0
[1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Вnon_trainable_variables
Гlayers
Дmetrics
 Еlayer_regularization_losses
Жlayer_metrics
®	variables
©trainable_variables
™regularization_losses
ђ__call__
+≠&call_and_return_all_conditional_losses
'≠"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Зnon_trainable_variables
Иlayers
Йmetrics
 Кlayer_regularization_losses
Лlayer_metrics
ѓ	variables
∞trainable_variables
±regularization_losses
≥__call__
+і&call_and_return_all_conditional_losses
'і"call_and_return_conditional_losses"
_generic_user_object
є2ґ≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
є2ґ≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Мnon_trainable_variables
Нlayers
Оmetrics
 Пlayer_regularization_losses
Рlayer_metrics
ґ	variables
Јtrainable_variables
Єregularization_losses
Ї__call__
+ї&call_and_return_all_conditional_losses
'ї"call_and_return_conditional_losses"
_generic_user_object
є2ґ≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
є2ґ≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
щBц
8__inference_global_average_pooling1d_layer_call_fn_18519inputs"ѓ
¶≤Ґ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ФBС
S__inference_global_average_pooling1d_layer_call_and_return_conditional_losses_18525inputs"ѓ
¶≤Ґ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
оBл
)__inference_dropout_2_layer_call_fn_18530inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
оBл
)__inference_dropout_2_layer_call_fn_18535inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЙBЖ
D__inference_dropout_2_layer_call_and_return_conditional_losses_18540inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЙBЖ
D__inference_dropout_2_layer_call_and_return_conditional_losses_18552inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
џBЎ
'__inference_dense_2_layer_call_fn_18561inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
B__inference_dense_2_layer_call_and_return_conditional_losses_18572inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
оBл
)__inference_dropout_3_layer_call_fn_18577inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
оBл
)__inference_dropout_3_layer_call_fn_18582inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЙBЖ
D__inference_dropout_3_layer_call_and_return_conditional_losses_18587inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЙBЖ
D__inference_dropout_3_layer_call_and_return_conditional_losses_18599inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
џBЎ
'__inference_dense_3_layer_call_fn_18608inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
B__inference_dense_3_layer_call_and_return_conditional_losses_18619inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
R
С	variables
Т	keras_api

Уtotal

Фcount"
_tf_keras_metric
c
Х	variables
Ц	keras_api

Чtotal

Шcount
Щ
_fn_kwargs"
_tf_keras_metric
J:H
†Ь 28Adam/m/token_and_position_embedding/embedding/embeddings
J:H
†Ь 28Adam/v/token_and_position_embedding/embedding/embeddings
K:I	» 2:Adam/m/token_and_position_embedding/embedding_1/embeddings
K:I	» 2:Adam/v/token_and_position_embedding/embedding_1/embeddings
N:L  2:Adam/m/transformer_block/multi_head_attention/query/kernel
N:L  2:Adam/v/transformer_block/multi_head_attention/query/kernel
H:F 28Adam/m/transformer_block/multi_head_attention/query/bias
H:F 28Adam/v/transformer_block/multi_head_attention/query/bias
L:J  28Adam/m/transformer_block/multi_head_attention/key/kernel
L:J  28Adam/v/transformer_block/multi_head_attention/key/kernel
F:D 26Adam/m/transformer_block/multi_head_attention/key/bias
F:D 26Adam/v/transformer_block/multi_head_attention/key/bias
N:L  2:Adam/m/transformer_block/multi_head_attention/value/kernel
N:L  2:Adam/v/transformer_block/multi_head_attention/value/kernel
H:F 28Adam/m/transformer_block/multi_head_attention/value/bias
H:F 28Adam/v/transformer_block/multi_head_attention/value/bias
Y:W  2EAdam/m/transformer_block/multi_head_attention/attention_output/kernel
Y:W  2EAdam/v/transformer_block/multi_head_attention/attention_output/kernel
O:M 2CAdam/m/transformer_block/multi_head_attention/attention_output/bias
O:M 2CAdam/v/transformer_block/multi_head_attention/attention_output/bias
#:!  2Adam/m/dense/kernel
#:!  2Adam/v/dense/kernel
: 2Adam/m/dense/bias
: 2Adam/v/dense/bias
%:#  2Adam/m/dense_1/kernel
%:#  2Adam/v/dense_1/kernel
: 2Adam/m/dense_1/bias
: 2Adam/v/dense_1/bias
>:< 22Adam/m/transformer_block/layer_normalization/gamma
>:< 22Adam/v/transformer_block/layer_normalization/gamma
=:; 21Adam/m/transformer_block/layer_normalization/beta
=:; 21Adam/v/transformer_block/layer_normalization/beta
@:> 24Adam/m/transformer_block/layer_normalization_1/gamma
@:> 24Adam/v/transformer_block/layer_normalization_1/gamma
?:= 23Adam/m/transformer_block/layer_normalization_1/beta
?:= 23Adam/v/transformer_block/layer_normalization_1/beta
%:# 2Adam/m/dense_2/kernel
%:# 2Adam/v/dense_2/kernel
:2Adam/m/dense_2/bias
:2Adam/v/dense_2/bias
%:#2Adam/m/dense_3/kernel
%:#2Adam/v/dense_3/kernel
:2Adam/m/dense_3/bias
:2Adam/v/dense_3/bias
ПBМ
"__inference__update_step_xla_18033gradient
gradient_1
gradient_2variable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ПBМ
"__inference__update_step_xla_18040gradient
gradient_1
gradient_2variable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18045gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18050gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18055gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18060gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18065gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18070gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18075gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18080gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18085gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18090gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18095gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18100gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18105gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18110gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18115gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18120gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18125gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18130gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18135gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
"__inference__update_step_xla_18140gradientvariable"Ј
Ѓ≤™
FullArgSpec2
args*Ъ'
jself

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
P
У0
Ф1
Х2
Ц3
Ч4
Ш5"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
L0
M1"
trackable_list_wrapper
.
L0
M1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Ъnon_trainable_variables
Ыlayers
Ьmetrics
 Эlayer_regularization_losses
Юlayer_metrics
Ј	variables
Єtrainable_variables
єregularization_losses
ї__call__
+Љ&call_and_return_all_conditional_losses
'Љ"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
.
N0
O1"
trackable_list_wrapper
.
N0
O1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Яnon_trainable_variables
†layers
°metrics
 Ґlayer_regularization_losses
£layer_metrics
њ	variables
јtrainable_variables
Ѕregularization_losses
√__call__
+ƒ&call_and_return_all_conditional_losses
'ƒ"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
.
P0
Q1"
trackable_list_wrapper
.
P0
Q1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
§non_trainable_variables
•layers
¶metrics
 Іlayer_regularization_losses
®layer_metrics
«	variables
»trainable_variables
…regularization_losses
Ћ__call__
+ћ&call_and_return_all_conditional_losses
'ћ"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Є
©non_trainable_variables
™layers
Ђmetrics
 ђlayer_regularization_losses
≠layer_metrics
ѕ	variables
–trainable_variables
—regularization_losses
”__call__
+‘&call_and_return_all_conditional_losses
'‘"call_and_return_conditional_losses"
_generic_user_object
µ2≤ѓ
¶≤Ґ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
µ2≤ѓ
¶≤Ґ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Ѓnon_trainable_variables
ѓlayers
∞metrics
 ±layer_regularization_losses
≤layer_metrics
’	variables
÷trainable_variables
„regularization_losses
ў__call__
+Џ&call_and_return_all_conditional_losses
'Џ"call_and_return_conditional_losses"
_generic_user_object
є2ґ≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
є2ґ≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
"
_generic_user_object
.
R0
S1"
trackable_list_wrapper
.
R0
S1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
≥non_trainable_variables
іlayers
µmetrics
 ґlayer_regularization_losses
Јlayer_metrics
№	variables
Ёtrainable_variables
ёregularization_losses
а__call__
+б&call_and_return_all_conditional_losses
'б"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
.
T0
U1"
trackable_list_wrapper
.
T0
U1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Єnon_trainable_variables
єlayers
Їmetrics
 їlayer_regularization_losses
Љlayer_metrics
д	variables
еtrainable_variables
жregularization_losses
и__call__
+й&call_and_return_all_conditional_losses
'й"call_and_return_conditional_losses"
_generic_user_object
л
љtrace_02ћ
%__inference_dense_layer_call_fn_18768Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zљtrace_0
Ж
Њtrace_02з
@__inference_dense_layer_call_and_return_conditional_losses_18799Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЊtrace_0
.
V0
W1"
trackable_list_wrapper
.
V0
W1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
њnon_trainable_variables
јlayers
Ѕmetrics
 ¬layer_regularization_losses
√layer_metrics
к	variables
лtrainable_variables
мregularization_losses
о__call__
+п&call_and_return_all_conditional_losses
'п"call_and_return_conditional_losses"
_generic_user_object
н
ƒtrace_02ќ
'__inference_dense_1_layer_call_fn_18808Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zƒtrace_0
И
≈trace_02й
B__inference_dense_1_layer_call_and_return_conditional_losses_18838Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z≈trace_0
 "
trackable_list_wrapper
0
Щ0
Ъ1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
АBэ
*__inference_sequential_layer_call_fn_16507dense_input"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ыBш
*__inference_sequential_layer_call_fn_18632inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ыBш
*__inference_sequential_layer_call_fn_18645inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
АBэ
*__inference_sequential_layer_call_fn_16580dense_input"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
E__inference_sequential_layer_call_and_return_conditional_losses_18702inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
E__inference_sequential_layer_call_and_return_conditional_losses_18759inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЫBШ
E__inference_sequential_layer_call_and_return_conditional_losses_16594dense_input"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЫBШ
E__inference_sequential_layer_call_and_return_conditional_losses_16608dense_input"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
У0
Ф1"
trackable_list_wrapper
.
С	variables"
_generic_user_object
:  (2total
:  (2count
0
Ч0
Ш1"
trackable_list_wrapper
.
Х	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ўB÷
%__inference_dense_layer_call_fn_18768inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
фBс
@__inference_dense_layer_call_and_return_conditional_losses_18799inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
џBЎ
'__inference_dense_1_layer_call_fn_18808inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
B__inference_dense_1_layer_call_and_return_conditional_losses_18838inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 Ў
"__inference__update_step_xla_18033±™Ґ¶
ЮҐЪ
VТS:Ґ7
ъ€€€€€€€€€ 
А
А
А
ъ€€€€€€€€€IndexedSlicesSpec 
6Т3	Ґ
ъ
†Ь 
А
p
` VariableSpec 
`Аџьш°Ё?
™ "
 ѕ
"__inference__update_step_xla_18040®°ҐЭ
ХҐС
NТK2Ґ/
ъ€€€€€€€€€ 
А
А
А
ъ»IndexedSlicesSpec 
5Т2	Ґ
ъ	» 
А
p
` VariableSpec 
`аќьш°Ё?
™ "
 Ь
"__inference__update_step_xla_18045vpҐm
fҐc
К
gradient  
8Т5	!Ґ
ъ  
А
p
` VariableSpec 
`†амїҐЁ?
™ "
 Ф
"__inference__update_step_xla_18050nhҐe
^Ґ[
К
gradient 
4Т1	Ґ
ъ 
А
p
` VariableSpec 
`јемїҐЁ?
™ "
 Ь
"__inference__update_step_xla_18055vpҐm
fҐc
К
gradient  
8Т5	!Ґ
ъ  
А
p
` VariableSpec 
`јумїҐЁ?
™ "
 Ф
"__inference__update_step_xla_18060nhҐe
^Ґ[
К
gradient 
4Т1	Ґ
ъ 
А
p
` VariableSpec 
`†ўмїҐЁ?
™ "
 Ь
"__inference__update_step_xla_18065vpҐm
fҐc
К
gradient  
8Т5	!Ґ
ъ  
А
p
` VariableSpec 
`јЙбїҐЁ?
™ "
 Ф
"__inference__update_step_xla_18070nhҐe
^Ґ[
К
gradient 
4Т1	Ґ
ъ 
А
p
` VariableSpec 
`јРбїҐЁ?
™ "
 Ь
"__inference__update_step_xla_18075vpҐm
fҐc
К
gradient  
8Т5	!Ґ
ъ  
А
p
` VariableSpec 
`аҐч»ҐЁ?
™ "
 М
"__inference__update_step_xla_18080f`Ґ]
VҐS
К
gradient 
0Т-	Ґ
ъ 
А
p
` VariableSpec 
`а®ч»ҐЁ?
™ "
 Э
"__inference__update_step_xla_18085wqҐn
gҐd
"К
gradient€€€€€€€€€ 
4Т1	Ґ
ъ  
А
p
` VariableSpec 
`јЁхїҐЁ?
™ "
 М
"__inference__update_step_xla_18090f`Ґ]
VҐS
К
gradient 
0Т-	Ґ
ъ 
А
p
` VariableSpec 
`аќЗщ°Ё?
™ "
 Э
"__inference__update_step_xla_18095wqҐn
gҐd
"К
gradient€€€€€€€€€ 
4Т1	Ґ
ъ  
А
p
` VariableSpec 
`аКЎ©ҐЁ?
™ "
 М
"__inference__update_step_xla_18100f`Ґ]
VҐS
К
gradient 
0Т-	Ґ
ъ 
А
p
` VariableSpec 
`†ТЎ©ҐЁ?
™ "
 М
"__inference__update_step_xla_18105f`Ґ]
VҐS
К
gradient 
0Т-	Ґ
ъ 
А
p
` VariableSpec 
`аьв»ҐЁ?
™ "
 М
"__inference__update_step_xla_18110f`Ґ]
VҐS
К
gradient 
0Т-	Ґ
ъ 
А
p
` VariableSpec 
`ацв»ҐЁ?
™ "
 М
"__inference__update_step_xla_18115f`Ґ]
VҐS
К
gradient 
0Т-	Ґ
ъ 
А
p
` VariableSpec 
`†Д„©ҐЁ?
™ "
 М
"__inference__update_step_xla_18120f`Ґ]
VҐS
К
gradient 
0Т-	Ґ
ъ 
А
p
` VariableSpec 
`аЗ„©ҐЁ?
™ "
 Ф
"__inference__update_step_xla_18125nhҐe
^Ґ[
К
gradient 
4Т1	Ґ
ъ 
А
p
` VariableSpec 
`ј±–©ҐЁ?
™ "
 М
"__inference__update_step_xla_18130f`Ґ]
VҐS
К
gradient
0Т-	Ґ
ъ
А
p
` VariableSpec 
`јї–©ҐЁ?
™ "
 Ф
"__inference__update_step_xla_18135nhҐe
^Ґ[
К
gradient
4Т1	Ґ
ъ
А
p
` VariableSpec 
`А¬ ©ҐЁ?
™ "
 М
"__inference__update_step_xla_18140f`Ґ]
VҐS
К
gradient
0Т-	Ґ
ъ
А
p
` VariableSpec 
`ј… ©ҐЁ?
™ "
 Ґ
 __inference__wrapped_model_16415~KJLMNOPQRSXYTUVWZ[9:HI1Ґ.
'Ґ$
"К
input_1€€€€€€€€€»
™ "1™.
,
dense_3!К
dense_3€€€€€€€€€≥
B__inference_dense_1_layer_call_and_return_conditional_losses_18838mVW4Ґ1
*Ґ'
%К"
inputs€€€€€€€€€» 
™ "1Ґ.
'К$
tensor_0€€€€€€€€€» 
Ъ Н
'__inference_dense_1_layer_call_fn_18808bVW4Ґ1
*Ґ'
%К"
inputs€€€€€€€€€» 
™ "&К#
unknown€€€€€€€€€» ©
B__inference_dense_2_layer_call_and_return_conditional_losses_18572c9:/Ґ,
%Ґ"
 К
inputs€€€€€€€€€ 
™ ",Ґ)
"К
tensor_0€€€€€€€€€
Ъ Г
'__inference_dense_2_layer_call_fn_18561X9:/Ґ,
%Ґ"
 К
inputs€€€€€€€€€ 
™ "!К
unknown€€€€€€€€€©
B__inference_dense_3_layer_call_and_return_conditional_losses_18619cHI/Ґ,
%Ґ"
 К
inputs€€€€€€€€€
™ ",Ґ)
"К
tensor_0€€€€€€€€€
Ъ Г
'__inference_dense_3_layer_call_fn_18608XHI/Ґ,
%Ґ"
 К
inputs€€€€€€€€€
™ "!К
unknown€€€€€€€€€±
@__inference_dense_layer_call_and_return_conditional_losses_18799mTU4Ґ1
*Ґ'
%К"
inputs€€€€€€€€€» 
™ "1Ґ.
'К$
tensor_0€€€€€€€€€» 
Ъ Л
%__inference_dense_layer_call_fn_18768bTU4Ґ1
*Ґ'
%К"
inputs€€€€€€€€€» 
™ "&К#
unknown€€€€€€€€€» Ђ
D__inference_dropout_2_layer_call_and_return_conditional_losses_18540c3Ґ0
)Ґ&
 К
inputs€€€€€€€€€ 
p 
™ ",Ґ)
"К
tensor_0€€€€€€€€€ 
Ъ Ђ
D__inference_dropout_2_layer_call_and_return_conditional_losses_18552c3Ґ0
)Ґ&
 К
inputs€€€€€€€€€ 
p
™ ",Ґ)
"К
tensor_0€€€€€€€€€ 
Ъ Е
)__inference_dropout_2_layer_call_fn_18530X3Ґ0
)Ґ&
 К
inputs€€€€€€€€€ 
p 
™ "!К
unknown€€€€€€€€€ Е
)__inference_dropout_2_layer_call_fn_18535X3Ґ0
)Ґ&
 К
inputs€€€€€€€€€ 
p
™ "!К
unknown€€€€€€€€€ Ђ
D__inference_dropout_3_layer_call_and_return_conditional_losses_18587c3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p 
™ ",Ґ)
"К
tensor_0€€€€€€€€€
Ъ Ђ
D__inference_dropout_3_layer_call_and_return_conditional_losses_18599c3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p
™ ",Ґ)
"К
tensor_0€€€€€€€€€
Ъ Е
)__inference_dropout_3_layer_call_fn_18577X3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p 
™ "!К
unknown€€€€€€€€€Е
)__inference_dropout_3_layer_call_fn_18582X3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p
™ "!К
unknown€€€€€€€€€Џ
S__inference_global_average_pooling1d_layer_call_and_return_conditional_losses_18525ВIҐF
?Ґ<
6К3
inputs'€€€€€€€€€€€€€€€€€€€€€€€€€€€

 
™ "5Ґ2
+К(
tensor_0€€€€€€€€€€€€€€€€€€
Ъ ≥
8__inference_global_average_pooling1d_layer_call_fn_18519wIҐF
?Ґ<
6К3
inputs'€€€€€€€€€€€€€€€€€€€€€€€€€€€

 
™ "*К'
unknown€€€€€€€€€€€€€€€€€€∆
@__inference_model_layer_call_and_return_conditional_losses_17464БKJLMNOPQRSXYTUVWZ[9:HI9Ґ6
/Ґ,
"К
input_1€€€€€€€€€»
p 

 
™ ",Ґ)
"К
tensor_0€€€€€€€€€
Ъ ∆
@__inference_model_layer_call_and_return_conditional_losses_17519БKJLMNOPQRSXYTUVWZ[9:HI9Ґ6
/Ґ,
"К
input_1€€€€€€€€€»
p

 
™ ",Ґ)
"К
tensor_0€€€€€€€€€
Ъ ≈
@__inference_model_layer_call_and_return_conditional_losses_17834АKJLMNOPQRSXYTUVWZ[9:HI8Ґ5
.Ґ+
!К
inputs€€€€€€€€€»
p 

 
™ ",Ґ)
"К
tensor_0€€€€€€€€€
Ъ ≈
@__inference_model_layer_call_and_return_conditional_losses_18026АKJLMNOPQRSXYTUVWZ[9:HI8Ґ5
.Ґ+
!К
inputs€€€€€€€€€»
p

 
™ ",Ґ)
"К
tensor_0€€€€€€€€€
Ъ Я
%__inference_model_layer_call_fn_16915vKJLMNOPQRSXYTUVWZ[9:HI9Ґ6
/Ґ,
"К
input_1€€€€€€€€€»
p 

 
™ "!К
unknown€€€€€€€€€Я
%__inference_model_layer_call_fn_17409vKJLMNOPQRSXYTUVWZ[9:HI9Ґ6
/Ґ,
"К
input_1€€€€€€€€€»
p

 
™ "!К
unknown€€€€€€€€€Ю
%__inference_model_layer_call_fn_17621uKJLMNOPQRSXYTUVWZ[9:HI8Ґ5
.Ґ+
!К
inputs€€€€€€€€€»
p 

 
™ "!К
unknown€€€€€€€€€Ю
%__inference_model_layer_call_fn_17670uKJLMNOPQRSXYTUVWZ[9:HI8Ґ5
.Ґ+
!К
inputs€€€€€€€€€»
p

 
™ "!К
unknown€€€€€€€€€≈
E__inference_sequential_layer_call_and_return_conditional_losses_16594|TUVWAҐ>
7Ґ4
*К'
dense_input€€€€€€€€€» 
p 

 
™ "1Ґ.
'К$
tensor_0€€€€€€€€€» 
Ъ ≈
E__inference_sequential_layer_call_and_return_conditional_losses_16608|TUVWAҐ>
7Ґ4
*К'
dense_input€€€€€€€€€» 
p

 
™ "1Ґ.
'К$
tensor_0€€€€€€€€€» 
Ъ ј
E__inference_sequential_layer_call_and_return_conditional_losses_18702wTUVW<Ґ9
2Ґ/
%К"
inputs€€€€€€€€€» 
p 

 
™ "1Ґ.
'К$
tensor_0€€€€€€€€€» 
Ъ ј
E__inference_sequential_layer_call_and_return_conditional_losses_18759wTUVW<Ґ9
2Ґ/
%К"
inputs€€€€€€€€€» 
p

 
™ "1Ґ.
'К$
tensor_0€€€€€€€€€» 
Ъ Я
*__inference_sequential_layer_call_fn_16507qTUVWAҐ>
7Ґ4
*К'
dense_input€€€€€€€€€» 
p 

 
™ "&К#
unknown€€€€€€€€€» Я
*__inference_sequential_layer_call_fn_16580qTUVWAҐ>
7Ґ4
*К'
dense_input€€€€€€€€€» 
p

 
™ "&К#
unknown€€€€€€€€€» Ъ
*__inference_sequential_layer_call_fn_18632lTUVW<Ґ9
2Ґ/
%К"
inputs€€€€€€€€€» 
p 

 
™ "&К#
unknown€€€€€€€€€» Ъ
*__inference_sequential_layer_call_fn_18645lTUVW<Ґ9
2Ґ/
%К"
inputs€€€€€€€€€» 
p

 
™ "&К#
unknown€€€€€€€€€» ±
#__inference_signature_wrapper_17572ЙKJLMNOPQRSXYTUVWZ[9:HI<Ґ9
Ґ 
2™/
-
input_1"К
input_1€€€€€€€€€»"1™.
,
dense_3!К
dense_3€€€€€€€€€њ
W__inference_token_and_position_embedding_layer_call_and_return_conditional_losses_18172dKJ+Ґ(
!Ґ
К
x€€€€€€€€€»
™ "1Ґ.
'К$
tensor_0€€€€€€€€€» 
Ъ Щ
<__inference_token_and_position_embedding_layer_call_fn_18149YKJ+Ґ(
!Ґ
К
x€€€€€€€€€»
™ "&К#
unknown€€€€€€€€€» ѕ
L__inference_transformer_block_layer_call_and_return_conditional_losses_18373LMNOPQRSXYTUVWZ[8Ґ5
.Ґ+
%К"
inputs€€€€€€€€€» 
p 
™ "1Ґ.
'К$
tensor_0€€€€€€€€€» 
Ъ ѕ
L__inference_transformer_block_layer_call_and_return_conditional_losses_18514LMNOPQRSXYTUVWZ[8Ґ5
.Ґ+
%К"
inputs€€€€€€€€€» 
p
™ "1Ґ.
'К$
tensor_0€€€€€€€€€» 
Ъ ©
1__inference_transformer_block_layer_call_fn_18209tLMNOPQRSXYTUVWZ[8Ґ5
.Ґ+
%К"
inputs€€€€€€€€€» 
p 
™ "&К#
unknown€€€€€€€€€» ©
1__inference_transformer_block_layer_call_fn_18246tLMNOPQRSXYTUVWZ[8Ґ5
.Ґ+
%К"
inputs€€€€€€€€€» 
p
™ "&К#
unknown€€€€€€€€€» 