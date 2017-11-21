#! /bin/bash
#nmt-dec
# commit 08e9ae2
# branch bots_dev
export model_path="/home/kuznetsov/tmp/thread30"
# export generator_path="/home/kuznetsov/embeddings/fasttext/models/model-l+w+2t-1/lenta+wiki+ted+tedx-1.bin"
rm -rf ${model_path}/model
mkdir  ${model_path}/model
cp -v $0 ${model_path}/model
#--pretrain_dec_emb_path=${model_path}/data/enc_embeddings.emb \
#--pretrain_dec_emb_path=${model_path}/data/dec_embeddings.emb \
# --attention=luong     \



python -m nmt.nmt     \
  --src=cor --tgt=man     \
  --share_vocab True \
  --vocab_prefix=${model_path}/data/vocab     \
  --train_prefix=${model_path}/data/train     \
  --dev_prefix=${model_path}/data/dev_test     \
  --test_prefix=${model_path}/data/test     \
  --out_dir=${model_path}/model     \
  --encoder_type bi \
  --batch_size 128     \
  --num_train_steps=3000000     \
  --steps_per_stats=100     \
  --num_layers=2     \
  --num_units=512     \
  --dropout=0.2     \
  --src_max_len=140    \
  --tgt_max_len=140  \
  --attention=luong     \
  --metrics=bleu
