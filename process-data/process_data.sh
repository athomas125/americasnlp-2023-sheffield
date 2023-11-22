# Get the path to americasnlp-2023-sheffield 
homedir=$(dirname "$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )")
# Get the path to the data directory (located in the main repository)
# THIS WILL ONLY WORK IF THIS FOLDER STAYS IN THIS LOCATION
datadir="$(dirname "$(dirname "$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )")")/data"
echo "HOME DIR: " $homedir
echo "DATA DIR: " $datadir
cd $datadir

# Remove all files
rm -rf americasnlp2023
rm -rf americasnlp2021-st
rm -rf data
rm -rf data-bin
rm -rf raw_data
rm -rf REPUcs-AmericasNLP2021
rm -rf nllb_md_data
rm -rf nllb_seed_data
mkdir data 

# Get data
git clone https://github.com/AmericasNLP/americasnlp2023.git

git clone https://github.com/Helsinki-NLP/americasnlp2021-st.git
mkdir raw_data

# Helsinki Extra data

mkdir raw_data/helsinki_extra

# Quechua
cat americasnlp2021-st/data/quechua-spanish/extra/sent-boconst_que.es \
americasnlp2021-st/data/quechua-spanish/extra/sent-peconst.es \
americasnlp2021-st/data/quechua-spanish/extra/tatoeba_qu.raw.es \
> raw_data/helsinki_extra/train.es-quy.es

cat americasnlp2021-st/data/quechua-spanish/extra/sent-boconst_que.que \
americasnlp2021-st/data/quechua-spanish/extra/sent-peconst.que \
americasnlp2021-st/data/quechua-spanish/extra/tatoeba_qu.raw.qu \
> raw_data/helsinki_extra/train.es-quy.quy

# Guarani
cat americasnlp2021-st/data/guarani-spanish/extra/sent-pyconst.es \
> raw_data/helsinki_extra/train.es-grn.es

cat americasnlp2021-st/data/guarani-spanish/extra/sent-pyconst.gn \
> raw_data/helsinki_extra/train.es-grn.grn

#Aymara
cat americasnlp2021-st/data/aymara-spanish/extra/jw_aym.aym \
americasnlp2021-st/data/aymara-spanish/extra/sent-boconst_aym.aym \
> raw_data/helsinki_extra/train.es-aym.aym

cat americasnlp2021-st/data/aymara-spanish/extra/jw_aym.es \
americasnlp2021-st/data/aymara-spanish/extra/sent-boconst_aym.es \
> raw_data/helsinki_extra/train.es-aym.es

#Hñähñu 
cat americasnlp2021-st/data/hñähñu-spanish/extra/mxconst.es \
americasnlp2021-st/data/hñähñu-spanish/extra/sent-mxconst.es \
> raw_data/helsinki_extra/train.es-oto.es

cat americasnlp2021-st/data/hñähñu-spanish/extra/mxconst.oto \
americasnlp2021-st/data/hñähñu-spanish/extra/sent-mxconst.oto \
> raw_data/helsinki_extra/train.es-oto.oto

#Nahuatl
cat americasnlp2021-st/data/nahuatl-spanish/extra/mxconst.es \
americasnlp2021-st/data/nahuatl-spanish/extra/sent-mxconst.es \
> raw_data/helsinki_extra/train.es-nah.es

cat americasnlp2021-st/data/nahuatl-spanish/extra/mxconst.nah \
americasnlp2021-st/data/nahuatl-spanish/extra/sent-mxconst.nah \
> raw_data/helsinki_extra/train.es-nah.nah

#Raramuri
cat americasnlp2021-st/data/raramuri-spanish/extra/mxconst.es \
americasnlp2021-st/data/raramuri-spanish/extra/sent-mxconst.es \
> raw_data/helsinki_extra/train.es-tar.es

cat americasnlp2021-st/data/raramuri-spanish/extra/mxconst.tar \
americasnlp2021-st/data/raramuri-spanish/extra/sent-mxconst.tar \
> raw_data/helsinki_extra/train.es-tar.tar

#Shipibo
python $homedir/process-data/process_shipibo_data.py

cat americasnlp2021-st/data/shipibo_konibo-spanish/extra/Educational_0.4_2.4_35/test-es-shi.es \
americasnlp2021-st/data/shipibo_konibo-spanish/extra/Educational_0.4_2.4_35/train-es-shi.es \
americasnlp2021-st/data/shipibo_konibo-spanish/extra/Educational_0.4_2.4_35/tune-es-shi.es \
americasnlp2021-st/data/shipibo_konibo-spanish/extra/Religious_0.2_2.4_35/test-es-shi.es \
americasnlp2021-st/data/shipibo_konibo-spanish/extra/Religious_0.2_2.4_35/train-es-shi.es \
americasnlp2021-st/data/shipibo_konibo-spanish/extra/Religious_0.2_2.4_35/tune-es-shi.es \
americasnlp2021-st/data/shipibo_konibo-spanish/extra/sent-leyartesano.es \
americasnlp2021-st/data/shipibo_konibo-spanish/extra/traduccionTsanas1.es \
> raw_data/helsinki_extra/train.es-shp.es

cat americasnlp2021-st/data/shipibo_konibo-spanish/extra/Educational_0.4_2.4_35/test-es-shi.shi \
americasnlp2021-st/data/shipibo_konibo-spanish/extra/Educational_0.4_2.4_35/train-es-shi.shi \
americasnlp2021-st/data/shipibo_konibo-spanish/extra/Educational_0.4_2.4_35/tune-es-shi.shi \
americasnlp2021-st/data/shipibo_konibo-spanish/extra/Religious_0.2_2.4_35/test-es-shi.shi \
americasnlp2021-st/data/shipibo_konibo-spanish/extra/Religious_0.2_2.4_35/train-es-shi.shi \
americasnlp2021-st/data/shipibo_konibo-spanish/extra/Religious_0.2_2.4_35/tune-es-shi.shi \
americasnlp2021-st/data/shipibo_konibo-spanish/extra/sent-leyartesano.shi \
americasnlp2021-st/data/shipibo_konibo-spanish/extra/traduccionTsanas1.shi \
> raw_data/helsinki_extra/train.es-shp.shp

#Wixarika
cat americasnlp2021-st/data/wixarika-spanish/extra/corpora.es \
americasnlp2021-st/data/wixarika-spanish/extra/sent-mxconst.es \
americasnlp2021-st/data/wixarika-spanish/extra/paral_own.es \
> raw_data/helsinki_extra/train.es-hch.es

cat americasnlp2021-st/data/wixarika-spanish/extra/corpora.wix \
americasnlp2021-st/data/wixarika-spanish/extra/sent-mxconst.hch \
americasnlp2021-st/data/wixarika-spanish/extra/paral_own.wix \
> raw_data/helsinki_extra/train.es-hch.hch

# REPUcs extra data
mkdir raw_data/repucs_extra

git clone https://github.com/Ceviche98/REPUcs-AmericasNLP2021.git

cat REPUcs-AmericasNLP2021/Handbook.es \
REPUcs-AmericasNLP2021/Lexicon.es \
REPUcs-AmericasNLP2021/WebMisc.es \
REPUcs-AmericasNLP2021/constitucion_simplified.es \
REPUcs-AmericasNLP2021/reglamento_simplified.es \
> raw_data/repucs_extra/train.es-quy.es

cat REPUcs-AmericasNLP2021/Handbook.quy \
REPUcs-AmericasNLP2021/Lexicon.quy \
REPUcs-AmericasNLP2021/WebMisc.quy \
REPUcs-AmericasNLP2021/constitucion_simplified.quz \
REPUcs-AmericasNLP2021/reglamento_simplified.quz \
> raw_data/repucs_extra/train.es-quy.quy

# NLLB MD data
mkdir nllb_md_data
cd nllb_md_data
wget https://tinyurl.com/NLLBMDchat
mv NLLBMDchat NLLBMDchat.zip
unzip NLLBMDchat.zip
wget https://tinyurl.com/NLLBMDnews
mv NLLBMDnews NLLBMDnews.zip
unzip NLLBMDnews.zip
wget https://tinyurl.com/NLLBMDhealth
mv NLLBMDhealth NLLBMDhealth.zip
unzip NLLBMDhealth.zip

cat ./*/*/*.eng_Latn-ayr_Latn.ayr_Latn > train.eng_Latn-ayr_Latn.ayr_Latn
cat ./*/*/*.eng_Latn-ayr_Latn.eng_Latn > train.eng_Latn-ayr_Latn.eng_Latn
cd ..

# NLLB Seed data
mkdir nllb_seed_data
cd nllb_seed_data
wget https://tinyurl.com/NLLBSeed
mv NLLBSeed NLLBSeed.zip
unzip NLLBSeed.zip
cd ..

# Process Spanish-Quechua data

cat americasnlp2023/data/quechua-spanish/parallel_data/es-quy/jw300.es-quy.es \
americasnlp2023/data/quechua-spanish/parallel_data/es-quy/minedu.quy-es.es \
americasnlp2023/data/quechua-spanish/parallel_data/es-quy/dict_misc.quy-es.es \
americasnlp2023/data/quechua-spanish/parallel_data/es-quz/jw300.es-quz.es \
raw_data/helsinki_extra/train.es-quy.es \
raw_data/repucs_extra/train.es-quy.es \
> americasnlp2023/data/quechua-spanish/parallel_data/train.es-quy.es

cat americasnlp2023/data/quechua-spanish/parallel_data/es-quy/jw300.es-quy.quy \
americasnlp2023/data/quechua-spanish/parallel_data/es-quy/minedu.quy-es.quy \
americasnlp2023/data/quechua-spanish/parallel_data/es-quy/dict_misc.quy-es.quy \
americasnlp2023/data/quechua-spanish/parallel_data/es-quz/jw300.es-quz.quz \
raw_data/helsinki_extra/train.es-quy.quy \
raw_data/repucs_extra/train.es-quy.quy \
> americasnlp2023/data/quechua-spanish/parallel_data/train.es-quy.quy


python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/quechua-spanish/parallel_data/train.es-quy.es \
--path2 americasnlp2023/data/quechua-spanish/parallel_data/train.es-quy.quy

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/quechua-spanish/dev.es \
--path2 americasnlp2023/data/quechua-spanish/dev.quy

# Process English-Quechua data

cat americasnlp2023/data/quechua-spanish/parallel_data/en-quy/jw300.en-quy.en \
americasnlp2023/data/quechua-spanish/parallel_data/en-quz/jw300.en-quz.en \
> americasnlp2023/data/quechua-spanish/parallel_data/train.en-quy.en

cat americasnlp2023/data/quechua-spanish/parallel_data/en-quy/jw300.en-quy.quy \
americasnlp2023/data/quechua-spanish/parallel_data/en-quz/jw300.en-quz.quz \
> americasnlp2023/data/quechua-spanish/parallel_data/train.en-quy.quy

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/quechua-spanish/parallel_data/train.en-quy.en \
--path2 americasnlp2023/data/quechua-spanish/parallel_data/train.en-quy.quy

# Process Spanish-Aymara data

cat americasnlp2023/data/aymara-spanish/parallel_data/es-aym/opus_globalvoices.es-aym.es \
raw_data/helsinki_extra/train.es-aym.es \
> americasnlp2023/data/aymara-spanish/parallel_data/train.es-aym.es

cat americasnlp2023/data/aymara-spanish/parallel_data/es-aym/opus_globalvoices.es-aym.aym \
raw_data/helsinki_extra/train.es-aym.es \
> americasnlp2023/data/aymara-spanish/parallel_data/train.es-aym.aym

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/aymara-spanish/parallel_data/train.es-aym.aym \
--path2 americasnlp2023/data/aymara-spanish/parallel_data/train.es-aym.es

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/aymara-spanish/dev.aym \
--path2 americasnlp2023/data/aymara-spanish/dev.es

# Process English-Aymara data

cat americasnlp2023/data/aymara-spanish/parallel_data/en-aym/opus_globalvoices.en-aym.en \
nllb_md_data/train.eng_Latn-ayr_Latn.eng_Latn \
> americasnlp2023/data/aymara-spanish/parallel_data/train.en-aym.en

cat americasnlp2023/data/aymara-spanish/parallel_data/en-aym/opus_globalvoices.en-aym.aym \
nllb_md_data/train.eng_Latn-ayr_Latn.ayr_Latn \
> americasnlp2023/data/aymara-spanish/parallel_data/train.en-aym.aym

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/aymara-spanish/parallel_data/train.en-aym.aym \
--path2 americasnlp2023/data/aymara-spanish/parallel_data/train.en-aym.en

# Process Spanish-Guarani data

cat raw_data/helsinki_extra/train.es-grn.es >> americasnlp2023/data/guarani-spanish/train.es
cat raw_data/helsinki_extra/train.es-grn.grn >> americasnlp2023/data/guarani-spanish/train.gn

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/guarani-spanish/train.es \
--path2 americasnlp2023/data/guarani-spanish/train.gn

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/guarani-spanish/dev.gn \
--path2 americasnlp2023/data/guarani-spanish/dev.es

# Process Spanish-Ashaninka data


python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/ashaninka-spanish/train.cni \
--path2 americasnlp2023/data/ashaninka-spanish/train.es

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/ashaninka-spanish/dev.cni \
--path2 americasnlp2023/data/ashaninka-spanish/dev.es

# Process Spanish-Bribri data

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/bribri-spanish/train.bzd \
--path2 americasnlp2023/data/bribri-spanish/train.es

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/bribri-spanish/dev.bzd \
--path2 americasnlp2023/data/bribri-spanish/dev.es

# Process Spanish-Hñähñu data (skipping because no access to detokenizer)

# cat raw_data/helsinki_extra/train.es-oto.es >> americasnlp2023/data/hñähñu-spanish/train.es
# cat raw_data/helsinki_extra/train.es-oto.oto >> americasnlp2023/data/hñähñu-spanish/train.oto

# perl $homedir/process-data/detokenizer.perl \
# < americasnlp2023/data/hñähñu-spanish/train.oto\
# > americasnlp2023/data/hñähñu-spanish/train_detok.oto

# perl $homedir/process-data/detokenizer.perl \
# < americasnlp2023/data/hñähñu-spanish/train.es\
# > americasnlp2023/data/hñähñu-spanish/train_detok.es

# python $homedir/process-data/remove_blank_lines.py \
# --path1 americasnlp2023/data/hñähñu-spanish/train_detok.oto \
# --path2 americasnlp2023/data/hñähñu-spanish/train_detok.es

# python $homedir/process-data/remove_blank_lines.py \
# --path1 americasnlp2023/data/hñähñu-spanish/dev.oto \
# --path2 americasnlp2023/data/hñähñu-spanish/dev.es

# Process Spanish-Nahuatl data (skipping because no access to detokenizer)

# cat raw_data/helsinki_extra/train.es-nah.es >> americasnlp2023/data/nahuatl-spanish/train.es
# cat raw_data/helsinki_extra/train.es-nah.nah >> americasnlp2023/data/nahuatl-spanish/train.nah

# perl $homedir/process-data/detokenizer.perl \
# < americasnlp2023/data/nahuatl-spanish/train.nah \
# > americasnlp2023/data/nahuatl-spanish/train_detok.nah

# perl $homedir/process-data/detokenizer.perl \
# < americasnlp2023/data/nahuatl-spanish/train.es \
# > americasnlp2023/data/nahuatl-spanish/train_detok.es

# python $homedir/process-data/remove_blank_lines.py \
# --path1 americasnlp2023/data/nahuatl-spanish/train_detok.nah \
# --path2 americasnlp2023/data/nahuatl-spanish/train_detok.es

# python $homedir/process-data/remove_blank_lines.py \
# --path1 americasnlp2023/data/nahuatl-spanish/dev.nah \
# --path2 americasnlp2023/data/nahuatl-spanish/dev.es

# Process Spanish-Raramuri data

cat raw_data/helsinki_extra/train.es-tar.es >> americasnlp2023/data/raramuri-spanish/train_nontok.es
cat raw_data/helsinki_extra/train.es-tar.tar >> americasnlp2023/data/raramuri-spanish/train_nontok.tar

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/raramuri-spanish/train_nontok.es \
--path2 americasnlp2023/data/raramuri-spanish/train_nontok.tar

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/raramuri-spanish/dev.es \
--path2 americasnlp2023/data/raramuri-spanish/dev.tar

# Process Spanish-Shipibo data

cat raw_data/helsinki_extra/train.es-shp.es >> americasnlp2023/data/shipibo_konibo-spanish/train.es
cat raw_data/helsinki_extra/train.es-shp.shp >> americasnlp2023/data/shipibo_konibo-spanish/train.shp

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/shipibo_konibo-spanish/train.es \
--path2 americasnlp2023/data/shipibo_konibo-spanish/train.shp

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/shipibo_konibo-spanish/dev.es \
--path2 americasnlp2023/data/shipibo_konibo-spanish/dev.shp

# Process Spanish-Wixarika data

cat raw_data/helsinki_extra/train.es-hch.es >> americasnlp2023/data/wixarika-spanish/train.es
cat raw_data/helsinki_extra/train.es-hch.hch >> americasnlp2023/data/wixarika-spanish/train.hch

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/wixarika-spanish/train.es \
--path2 americasnlp2023/data/wixarika-spanish/train.hch

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/wixarika-spanish/dev.es \
--path2 americasnlp2023/data/wixarika-spanish/dev.hch

# Process Spanish-Chatino data

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/chatino-spanish/train.es \
--path2 americasnlp2023/data/chatino-spanish/train.czn

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/chatino-spanish/dev.es \
--path2 americasnlp2023/data/chatino-spanish/dev.czn

# Process English-Chatino data

mkdir americasnlp2023/data/chatino-spanish/czn-eng
awk -F'\t' '{print $3}' americasnlp2023/data/chatino-spanish/ctp-eng.tsv \
> americasnlp2023/data/chatino-spanish/czn-eng/train.czn

awk -F'\t' '{print $5}' americasnlp2023/data/chatino-spanish/ctp-eng.tsv \
> americasnlp2023/data/chatino-spanish/czn-eng/train.en

python $homedir/process-data/remove_blank_lines.py \
--path1 americasnlp2023/data/chatino-spanish/czn-eng/train.en \
--path2 americasnlp2023/data/chatino-spanish/czn-eng/train.czn


# Replace characters
declare -a files=("americasnlp2023/data/quechua-spanish/parallel_data/train.es-quy.quy_filtered"
"americasnlp2023/data/quechua-spanish/parallel_data/train.es-quy.es_filtered"
"americasnlp2023/data/quechua-spanish/dev.quy_filtered"
"americasnlp2023/data/quechua-spanish/dev.es_filtered"
"americasnlp2023/data/quechua-spanish/parallel_data/train.en-quy.quy_filtered"
"americasnlp2023/data/quechua-spanish/parallel_data/train.en-quy.en_filtered"
"americasnlp2023/data/aymara-spanish/parallel_data/train.es-aym.aym_filtered"
"americasnlp2023/data/aymara-spanish/parallel_data/train.es-aym.es_filtered"
"americasnlp2023/data/aymara-spanish/dev.aym_filtered"
"americasnlp2023/data/aymara-spanish/dev.es_filtered"
"americasnlp2023/data/aymara-spanish/parallel_data/train.en-aym.aym_filtered"
"americasnlp2023/data/aymara-spanish/parallel_data/train.en-aym.en_filtered"
"americasnlp2023/data/guarani-spanish/train.gn_filtered"
"americasnlp2023/data/guarani-spanish/train.es_filtered"
"americasnlp2023/data/guarani-spanish/dev.gn_filtered"
"americasnlp2023/data/guarani-spanish/dev.es_filtered"
"americasnlp2023/data/ashaninka-spanish/dev.cni_filtered"
"americasnlp2023/data/ashaninka-spanish/dev.es_filtered"
"americasnlp2023/data/ashaninka-spanish/train.cni_filtered"
"americasnlp2023/data/ashaninka-spanish/train.es_filtered"
"americasnlp2023/data/bribri-spanish/train.es_filtered"
"americasnlp2023/data/bribri-spanish/train.bzd_filtered"
"americasnlp2023/data/bribri-spanish/dev.es_filtered"
"americasnlp2023/data/bribri-spanish/dev.bzd_filtered"
# "americasnlp2023/data/hñähñu-spanish/train_detok.es_filtered"
# "americasnlp2023/data/hñähñu-spanish/train_detok.oto_filtered"
# "americasnlp2023/data/hñähñu-spanish/dev.es_filtered"
# "americasnlp2023/data/hñähñu-spanish/dev.oto_filtered"
# "americasnlp2023/data/nahuatl-spanish/train_detok.es_filtered"
# "americasnlp2023/data/nahuatl-spanish/train_detok.nah_filtered"
# "americasnlp2023/data/nahuatl-spanish/dev.es_filtered"
# "americasnlp2023/data/nahuatl-spanish/dev.nah_filtered"
"americasnlp2023/data/raramuri-spanish/train_nontok.es_filtered"
"americasnlp2023/data/raramuri-spanish/train_nontok.tar_filtered"
"americasnlp2023/data/raramuri-spanish/dev.es_filtered"
"americasnlp2023/data/raramuri-spanish/dev.tar_filtered"
"americasnlp2023/data/shipibo_konibo-spanish/train.es_filtered"
"americasnlp2023/data/shipibo_konibo-spanish/train.shp_filtered"
"americasnlp2023/data/shipibo_konibo-spanish/dev.es_filtered"
"americasnlp2023/data/shipibo_konibo-spanish/dev.shp_filtered"
"americasnlp2023/data/wixarika-spanish/train.es_filtered"
"americasnlp2023/data/wixarika-spanish/train.hch_filtered"
"americasnlp2023/data/wixarika-spanish/dev.es_filtered"
"americasnlp2023/data/wixarika-spanish/dev.hch_filtered"
"americasnlp2023/data/chatino-spanish/train.es_filtered"
"americasnlp2023/data/chatino-spanish/train.czn_filtered"
"americasnlp2023/data/chatino-spanish/dev.es_filtered"
"americasnlp2023/data/chatino-spanish/dev.czn_filtered"
"americasnlp2023/data/chatino-spanish/czn-eng/train.en_filtered"
"americasnlp2023/data/chatino-spanish/czn-eng/train.czn_filtered"
"nllb_seed_data/NLLB-Seed/eng_Latn-grn_Latn/eng_Latn"
"nllb_seed_data/NLLB-Seed/eng_Latn-grn_Latn/grn_Latn"
)

echo $files 
for f in "${files[@]}"
do
    echo $f
    sed -i "s/\“/@\"/g" $f
    sed -i "s/\”/調\"/g" $f
    sed -i "s/\“/付\"/g" $f
    sed -i "s/\’/혼\'/g" $f
    sed -i "s/\‘/ච\'/g" $f
    sed -i "s/\—/완\-/g" $f
    sed -i "s/\–/罪\-/g" $f
    sed -i "s/\«/\<\</g" $f
    sed -i "s/\»/\>\>/g" $f
    sed -i "s/\‚/\,/g" $f
done

# Sentencepiece

cat americasnlp2023/data/quechua-spanish/parallel_data/train.es-quy.quy_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/train.spa_Latn-quy_Latn.quy_Latn

cat americasnlp2023/data/quechua-spanish/parallel_data/train.es-quy.es_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/train.spa_Latn-quy_Latn.spa_Latn

cat americasnlp2023/data/quechua-spanish/dev.quy_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/dev.spa_Latn-quy_Latn.quy_Latn

cat americasnlp2023/data/quechua-spanish/dev.es_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/dev.spa_Latn-quy_Latn.spa_Latn

cat americasnlp2023/data/quechua-spanish/parallel_data/train.en-quy.quy_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/train.eng_Latn-quy_Latn.quy_Latn

cat americasnlp2023/data/quechua-spanish/parallel_data/train.en-quy.en_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/train.eng_Latn-quy_Latn.eng_Latn

cat americasnlp2023/data/aymara-spanish/parallel_data/train.es-aym.aym_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/train.spa_Latn-ayr_Latn.ayr_Latn

cat americasnlp2023/data/aymara-spanish/parallel_data/train.es-aym.es_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/train.spa_Latn-ayr_Latn.spa_Latn

cat americasnlp2023/data/aymara-spanish/dev.aym_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/dev.spa_Latn-ayr_Latn.ayr_Latn

cat americasnlp2023/data/aymara-spanish/dev.es_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/dev.spa_Latn-ayr_Latn.spa_Latn

cat americasnlp2023/data/aymara-spanish/parallel_data/train.en-aym.aym_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/train.eng_Latn-ayr_Latn.ayr_Latn

cat americasnlp2023/data/aymara-spanish/parallel_data/train.en-aym.en_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/train.eng_Latn-ayr_Latn.eng_Latn

cat americasnlp2023/data/guarani-spanish/train.gn_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/train.spa_Latn-grn_Latn.grn_Latn

cat americasnlp2023/data/guarani-spanish/train.es_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/train.spa_Latn-grn_Latn.spa_Latn

cat americasnlp2023/data/guarani-spanish/dev.gn_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/dev.spa_Latn-grn_Latn.grn_Latn

cat americasnlp2023/data/guarani-spanish/dev.es_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/dev.spa_Latn-grn_Latn.spa_Latn

cat nllb_seed_data/NLLB-Seed/eng_Latn-grn_Latn/eng_Latn | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/train.eng_Latn-grn_Latn.eng_Latn

cat nllb_seed_data/NLLB-Seed/eng_Latn-grn_Latn/grn_Latn | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/train.eng_Latn-grn_Latn.grn_Latn

t=ashaninka
ttag=cni
for split in train dev
do
cat americasnlp2023/data/${t}-spanish/${split}.${ttag}_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/${split}.spa_Latn-${ttag}_Latn.${ttag}_Latn

cat americasnlp2023/data/${t}-spanish/${split}.es_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/${split}.spa_Latn-${ttag}_Latn.spa_Latn
done

t=bribri
ttag=bzd
for split in train dev
do
cat americasnlp2023/data/${t}-spanish/${split}.${ttag}_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/${split}.spa_Latn-${ttag}_Latn.${ttag}_Latn

cat americasnlp2023/data/${t}-spanish/${split}.es_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/${split}.spa_Latn-${ttag}_Latn.spa_Latn
done

t=chatino
ttag=czn
for split in train dev
do
cat americasnlp2023/data/${t}-spanish/${split}.${ttag}_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/${split}.spa_Latn-${ttag}_Latn.${ttag}_Latn

cat americasnlp2023/data/${t}-spanish/${split}.es_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/${split}.spa_Latn-${ttag}_Latn.spa_Latn
done

t=chatino
ttag=czn
for split in train
do
cat americasnlp2023/data/${t}-spanish/czn-eng/${split}.${ttag}_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/${split}.eng_Latn-${ttag}_Latn.${ttag}_Latn

cat americasnlp2023/data/${t}-spanish/czn-eng/${split}.en_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/${split}.eng_Latn-${ttag}_Latn.eng_Latn
done

# t=hñähñu
# ttag=oto
# for split in train_detok dev
# do
# cat americasnlp2023/data/${t}-spanish/${split}.${ttag}_filtered | python $homedir/fairseq/scripts/spm_encode.py \
# --model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
# > data/${split}.spa_Latn-${ttag}_Latn.${ttag}_Latn

# cat americasnlp2023/data/${t}-spanish/${split}.es_filtered | python $homedir/fairseq/scripts/spm_encode.py \
# --model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
# > data/${split}.spa_Latn-${ttag}_Latn.spa_Latn
# done
# mv data/train_detok.spa_Latn-oto_Latn.spa_Latn data/train.spa_Latn-oto_Latn.spa_Latn
# mv data/train_detok.spa_Latn-oto_Latn.oto_Latn data/train.spa_Latn-oto_Latn.oto_Latn

# t=nahuatl
# ttag=nah
# for split in train_detok dev
# do
# cat americasnlp2023/data/${t}-spanish/${split}.${ttag}_filtered | python $homedir/fairseq/scripts/spm_encode.py \
# --model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
# > data/${split}.spa_Latn-${ttag}_Latn.${ttag}_Latn

# cat americasnlp2023/data/${t}-spanish/${split}.es_filtered | python $homedir/fairseq/scripts/spm_encode.py \
# --model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
# > data/${split}.spa_Latn-${ttag}_Latn.spa_Latn
# done
# mv data/train_detok.spa_Latn-nah_Latn.spa_Latn data/train.spa_Latn-nah_Latn.spa_Latn
# mv data/train_detok.spa_Latn-nah_Latn.nah_Latn data/train.spa_Latn-nah_Latn.nah_Latn

t=raramuri
ttag=tar
for split in train_nontok dev
do
cat americasnlp2023/data/${t}-spanish/${split}.${ttag}_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/${split}.spa_Latn-${ttag}_Latn.${ttag}_Latn

cat americasnlp2023/data/${t}-spanish/${split}.es_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/${split}.spa_Latn-${ttag}_Latn.spa_Latn
done
mv data/train_nontok.spa_Latn-tar_Latn.spa_Latn data/train.spa_Latn-tar_Latn.spa_Latn
mv data/train_nontok.spa_Latn-tar_Latn.tar_Latn data/train.spa_Latn-tar_Latn.tar_Latn

t=shipibo_konibo
ttag=shp
for split in train dev
do
cat americasnlp2023/data/${t}-spanish/${split}.${ttag}_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/${split}.spa_Latn-${ttag}_Latn.${ttag}_Latn

cat americasnlp2023/data/${t}-spanish/${split}.es_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/${split}.spa_Latn-${ttag}_Latn.spa_Latn
done

t=wixarika
ttag=hch
for split in train dev
do
cat americasnlp2023/data/${t}-spanish/${split}.${ttag}_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/${split}.spa_Latn-${ttag}_Latn.${ttag}_Latn

cat americasnlp2023/data/${t}-spanish/${split}.es_filtered | python $homedir/fairseq/scripts/spm_encode.py \
--model $homedir/NLLB-inference/preprocess/flores200_sacrebleu_tokenizer_spm.model \
> data/${split}.spa_Latn-${ttag}_Latn.spa_Latn
done


# Fairseq preprocess

fairseq-preprocess --source-lang spa_Latn --target-lang quy_Latn \
    --trainpref data/train.spa_Latn-quy_Latn \
    --validpref data/dev.spa_Latn-quy_Latn \
    --joined-dictionary	\
    --srcdict $homedir/nllb-600M/dictionary.txt \
    --destdir data-bin/spa_Latn-quy_Latn/ \
    --workers 10

fairseq-preprocess --source-lang eng_Latn --target-lang quy_Latn \
    --trainpref data/train.eng_Latn-quy_Latn \
    --joined-dictionary	\
    --bpe sentencepiece \
    --srcdict $homedir/nllb-600M/dictionary.txt \
    --destdir data-bin/eng_Latn-quy_Latn/ \
    --workers 10

fairseq-preprocess --source-lang spa_Latn --target-lang ayr_Latn \
    --trainpref data/train.spa_Latn-ayr_Latn \
    --validpref data/dev.spa_Latn-ayr_Latn \
    --joined-dictionary	\
    --srcdict $homedir/nllb-600M/dictionary.txt \
    --destdir data-bin/spa_Latn-ayr_Latn/ \
    --workers 10

fairseq-preprocess --source-lang eng_Latn --target-lang ayr_Latn \
    --trainpref data/train.eng_Latn-ayr_Latn \
    --joined-dictionary	\
    --srcdict $homedir/nllb-600M/dictionary.txt \
    --destdir data-bin/eng_Latn-ayr_Latn/ \
    --workers 10

fairseq-preprocess --source-lang spa_Latn --target-lang grn_Latn \
    --trainpref data/train.spa_Latn-grn_Latn \
    --validpref data/dev.spa_Latn-grn_Latn \
    --joined-dictionary	\
    --srcdict $homedir/nllb-600M/dictionary.txt \
    --destdir data-bin/spa_Latn-grn_Latn/ \
    --workers 10

fairseq-preprocess --source-lang eng_Latn --target-lang grn_Latn \
    --trainpref data/train.eng_Latn-grn_Latn \
    --joined-dictionary	\
    --srcdict $homedir/nllb-600M/dictionary.txt \
    --destdir data-bin/eng_Latn-grn_Latn/ \
    --workers 10

for tgt in hch shp tar czn bzd cni # nah oto
do
fairseq-preprocess --source-lang spa_Latn --target-lang ${tgt}_Latn \
    --trainpref data/train.spa_Latn-${tgt}_Latn \
    --validpref data/dev.spa_Latn-${tgt}_Latn \
    --joined-dictionary	\
    --srcdict $homedir/nllb-600M/dictionary.txt \
    --destdir data-bin/spa_Latn-${tgt}_Latn/ \
    --workers 10
done

tgt=czn
fairseq-preprocess --source-lang eng_Latn --target-lang ${tgt}_Latn \
    --trainpref data/train.eng_Latn-${tgt}_Latn \
    --joined-dictionary	\
    --srcdict $homedir/nllb-600M/dictionary.txt \
    --destdir data-bin/eng_Latn-${tgt}_Latn/ \
    --workers 10

# Put all files together

mkdir data-bin/combined
cp data-bin/*/*.bin data-bin/combined
cp data-bin/*/*.idx data-bin/combined
cp data-bin/*/dict.*.txt data-bin/combined
