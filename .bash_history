gds
gc -m '(Fix) Ajuste ao pegar `itemsArray`'
ggp
gl
ggl
container optimus
find-in-files web 'CartPricesTable'
gsutil -m cp -R ./build/beyoung.com.br_notestab_final_finalizar_mobile_organic_ gs://bbrands-optimus-build/build
gst
ls -l
cat gcp-credentials.json 
ntr
gsutil -m cp -R ./build/beyoung.com.br_notestab_final_finalizar_mobile_organic_ gs://bbrands-optimus-build/build -h "Cache-Control:no-cache"
gsutil -m -h "Cache-Control:no-cache" cp -R ./build/beyoung.com.br_notestab_final_finalizar_mobile_organic_ gs://bbrands-optimus-build/build
gst
gd
ga .
gc
ggp
gst
gr .
git branch
gco nps/DEV-3355
gst
git stash list
git stash pop
gst
git stash save
gco staging
ggl
gco -b DEV-3554
ntr
gst
gd src/core/cart/cart.manager.ts
gd src/
gst
ga .
gds
gc
ggp
gco master
ggl
ls -l
cat gcp-credentials
cat gcp-credentials.json 
gco staging
ggl
gst
ga .
gc -m '(Fix) Não exibir brindes'
ggp
gco master
ggl
ntr
gst
gd
gst
gd src/
gr src/
gst
ga .
gds
gc -m '(Fix) Ajuste para não considerar brinde na quantidade de produtos no carrinho'
ggp
gco DEV-3554
ntr
gco master
ntr
copy-ip
ntr
copy-ip
ntr
redis-cli
copy-ip
redis-cli -h 10.0.0.123 -p 6378
copy-ip
redis-cli -h 10.8.0.46 -p 6378
redis-cli -h 10.0.0.123 -p 6378
copy-ip
redis-cli -p 6378
ntr
find-in-files 'micellar-water.png'
gst
rm production.json 
gco -
ntr
exit
gcloud compute ssh infra --zone us-east4-a  -- -N -L 6378:10.1.16.4:6379
gcloud compute ssh infra --zone us-east4-a  -- -N -L 10.8.0.46:6378:10.1.16.4:6379
redis-cli -h redis.staging.bbrands.com.br SET OPTIMUS:OPTIMUS_INTERNAL_PRODUCTION "{\"REDIS_CART_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_CART_PORT\":\"6379\",\"REDIS_CART_DB\":\"8\",\"ELASTICSEARCH_LOG_HOST\":\"internal.es.bbrands.com.br\",\"ELASTICSEARCH_LOG_PORT\":\"80\",\"ELASTICSEARCH_LOG_LEVEL\":\"\",\"SLACK_WEBHOOK_URL\":\"https:\\/\\/hooks.slack.com\\/services\\/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\",\"MEGAN_URL\":\"http:\\/\\/internal.megan.bbrands.com.br\",\"ELAV_API_URL\":\"http:\\/\\/internal.api.bbrands.com.br\",\"ELAV_USERNAME\":\"mybeautycaps\",\"ELAV_PASSWORD\":\"slimcaps123@\",\"BULK_KEY\":\"NPdfEyChUbF54VLSw3qov8eTxB7GQuaY\",\"JAIMINHO_URL\":\"http:\\/\\/internal.jaiminho.bbrands.com.br\",\"FREIGHT_SOURCES_8S_DEFAULT\":\"8S-02\",\"FREIGHT_SOURCES_VP_DEFAULT\":\"VP-06\",\"FREIGHT_SOURCES_VP_SP\":\"VP-01\",\"FREIGHT_SOURCES_8S_RJ\":\"8S-03\",\"FREIGHT_SOURCES_VP_RJ\":\"VP-03\",\"STARK_URL\":\"http:\\/\\/internal.stark.bbrands.com.br\",\"BUILD_URL\":\"https:\\/\\/storage.googleapis.com\\/bbrands-optimus-build\",\"AWS_S3_ACCESS_KEY\":\"GOOGICLU52HYDB74MNM7QE6U\",\"AWS_S3_SECRET_KEY\":\"bj6\\/Ar4sYMc+U1cMqV3LwRZyp+XFBfo3rSfGtyIk\",\"AWS_S3_REGION\":\"us-east4\",\"AWS_S3_BUCKET\":\"bbrands-optimus-build\",\"RECAPTCHA_SITE_KEY\":\"6LcYZGEUAAAAAKLTb067xn-XYxa155HwyHR9STLv\",\"RECAPTCHA_SECRET_KEY\":\"6LcYZGEUAAAAAPNnnw6GQ6sXIr8bcHzy9LaeMDTX\",\"ZENDESK_USERNAME_HCSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_HCSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_HCSITE\":\"https:\\/\\/triptomax.zendesk.com\",\"ZENDESK_USERNAME_SCSITE\":\"felipe.sulimam@slimcaps.com.br\",\"ZENDESK_TOKEN_SCSITE\":\"nRQFBxDuewFfhPcfkbhLmfrlxKWGa0rDN65Z07Kl\",\"ZENDESK_URL_SCSITE\":\"https:\\/\\/slimcaps.zendesk.com\",\"ZENDESK_USERNAME_BYSITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYSITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYSITE\":\"https:\\/\\/beyoung.zendesk.com\",\"ZENDESK_USERNAME_BYISITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYISITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYISITE\":\"https:\\/\\/beyoung.zendesk.com\",\"ZENDESK_USERNAME_TMSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_TMSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_TMSITE\":\"https:\\/\\/triptomax.zendesk.com\",\"ZENDESK_USERNAME_MBSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_MBSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_MBSITE\":\"https:\\/\\/triptomax.zendesk.com\",\"ZENDESK_USERNAME_P4ESITE\":\"atendimento@platinum4ever.com.br\",\"ZENDESK_TOKEN_P4ESITE\":\"pZHSi9HMcub46c8cd2A6PtLrfQBtg8ens39BR5YA\",\"ZENDESK_URL_P4ESITE\":\"https:\\/\\/platinum4ever.zendesk.com\",\"ZENDESK_USERNAME_BCSITE\":\"atendimento@haircaps.com.br\",\"ZENDESK_TOKEN_BCSITE\":\"03tIo1DtrWNmqWrWoo7SV3jWzhHIiGCrtumlic0b\",\"ZENDESK_URL_BCSITE\":\"https:\\/\\/haircaps.zendesk.com\",\"ZENDESK_USERNAME_4EBSITE\":\"\",\"ZENDESK_TOKEN_4EBSITE\":\"\",\"ZENDESK_URL_4EBSITE\":\"\",\"ZENDESK_USERNAME_4EGSITE\":\"\",\"ZENDESK_TOKEN_4EGSITE\":\"\",\"ZENDESK_URL_4EGSITE\":\"\",\"ZENDESK_USERNAME_4EMSITE\":\"\",\"ZENDESK_TOKEN_4EMSITE\":\"\",\"ZENDESK_URL_4EMSITE\":\"\",\"ZENDESK_USERNAME_4EDSITE\":\"\",\"ZENDESK_TOKEN_4EDSITE\":\"\",\"ZENDESK_URL_4EDSITE\":\"\",\"FURY_URL\":\"http:\\/\\/internal.fury.bbrands.com.br\",\"AWS_S3_ENDPOINT\":\"https:\\/\\/storage.googleapis.com\",\"GCP_BIGQUERY_PROJECT_ID\":\"bbrands-production\",\"GCP_BIGQUERY_BUCKET\":\"bbrands-optimus-bigquery\",\"GCP_BIGQUERY_DB\":\"optimus\",\"GCP_BIGQUERY_URL_TABLE\":\"tracking\",\"REDIS_TRACE_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_TRACE_PORT\":\"6379\",\"REDIS_TRACE_DB\":\"6\",\"FREIGHT_SOURCES_8S_RS\":\"8S-04\",\"PAGSEGURO_EMAIL\":\"felipe.sulimam@slimcaps.com.br\",\"PAGSEGURO_TOKEN\":\"ACAB312D0F994154A51D5C3431FE2282\",\"STORE_GTM_CODE_HCSITE\":\"GTM-K3VHHNL\",\"REDIS_CACHE_EMAIL_HOST\":\"redis.cache.bbrands.com.br\",\"REDIS_CACHE_EMAIL_PORT\":\"6379\",\"REDIS_CACHE_EMAIL_DB\":\"10\",\"SLACK_CHANNEL\":\"logger-optimus\",\"FREIGHT_SOURCES_8S_MG\":\"8S-09\",\"FREIGHT_SOURCES_8S_BA\":\"8S-06\",\"FREIGHT_SOURCES_8S_GO\":\"8S-05\",\"FREIGHT_SOURCES_8S_DF\":\"8S-08\",\"GCP_BIGQUERY_URL_NPS_TABLE\":\"nps\",\"REDIS_NPS_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_NPS_PORT\":\"6379\",\"REDIS_NPS_DB\":\"4\",\"JO_URL\":\"http:\\/\\/internal.jo.bbrands.com.br\",\"FREIGHT_SOURCES_8S_SP\":\"8S-02\",\"NEWSLETTER_SQS_SECRET_ACCESS_KEY\":\"hH95llcey+Hz8wEh4ThMhWc5OnPcF2TBA7S6x+Pc\",\"NEWSLETTER_SQS_ACCESS_KEY_ID\":\"AKIAJ2FDL6IZJRD5RNZA\",\"NEWSLETTER_SQS_REGION\":\"sa-east-1\",\"NEWSLETTER_SQS_URL\":\"https:\\/\\/sqs.sa-east-1.amazonaws.com\\/457003475386\\/email_handler\",\"COLLECTOR_URL\":\"http:\\/\\/collector.bbrands.com.br\",\"USE_COLLECTOR\":\"1\",\"STORE_GTM_CODE_BY_CART\":\"GTM-KCXJ4P\",\"HEIMDALL_URL\":\"https:\\/\\/heimdall.bbrands.com.br\",\"HEIMDALL_LOGIN\":\"optimus\",\"HEIMDALL_PASS\":\"xzeEGAnN9nPgdnDk\",\"GANDALF_URL\":\"https:\\/\\/gandalf.bbrands.com.br\",\"PAINEL_URL\":\"http:\\/\\/painel.the8co.com.br\",\"JWT_KEY\":\"NKrr69h6ecEvHtEa\",\"ZENDESK_USERNAME_BY_CART\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BY_CART\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BY_CART\":\"https:\\/\\/beyoung.zendesk.com\",\"GANDALF_LOGIN\":\"optimus@bbrands.com.br\",\"GANDALF_PASS\":\"xzeEGAnN9nPgdnDk\",\"EXTERNAL_INTEGRATION_COLOR_ID_URL\":\"https:\\/\\/beyoung.com.br\\/api\\/external-integration-open\",\"EXTERNAL_INTEGRATION_COLOR_ID_APP_URL\":\"https:\\/\\/colorid.ai\\/colorid\\/2\",\"EXTERNAL_INTEGRATION_COLOR_ID_CALLBACK_URL\":\"https:\\/\\/beyoung.com.br\\/api\\/color-id\",\"DOC_URL\":\"http:\\/\\/doc.bbrands.com.br\",\"DB_TYPE\":\"mysql\",\"DB_HOST\":\"internal.marvel.bbrands.com.br\",\"DB_PORT\":\"3306\",\"DB_USERNAME\":\"optimus\",\"DB_PASSWORD\":\"CuY57BevdcQ4f7hh^$kAwSdX@vKmd,\"DB_DATABASE\":\"optimus\",\"DB_CHARSET\":\"utf8mb4\",\"DB_DEFAULT_ENGINE\":\"InnoDB\",\"DB_LOGGING\":\"false\",\"REDIS_CACHE_HOST\":\"\",\"REDIS_CACHE_PORT\":\"6379\",\"REDIS_CACHE_DB\":\"0\",\"PACKAGE_DEFAULT_WEIGHT\":\"106\",\"STORE_GTM_CODE_BYPSITE\":\"GTM-KCXJ4P\",\"LUCIUS_URL\":\"http:\\/\\/internal.lucius.bbrands.com.br\"}"
redis-cli -h redis.staging.bbrands.com.br SET OPTIMUS:OPTIMUS_PRODUCTION "{\"REDIS_CART_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_CART_PORT\":\"6379\",\"REDIS_CART_DB\":\"8\",\"ELASTICSEARCH_LOG_HOST\":\"internal.es.bbrands.com.br\",\"ELASTICSEARCH_LOG_PORT\":\"80\",\"ELASTICSEARCH_LOG_LEVEL\":\"\",\"SLACK_WEBHOOK_URL\":\"https:\\/\\/hooks.slack.com\\/services\\/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\",\"MEGAN_URL\":\"http:\\/\\/internal.megan.bbrands.com.br\",\"ELAV_API_URL\":\"http:\\/\\/internal.api.bbrands.com.br\",\"ELAV_USERNAME\":\"mybeautycaps\",\"ELAV_PASSWORD\":\"slimcaps123@\",\"BULK_KEY\":\"NPdfEyChUbF54VLSw3qov8eTxB7GQuaY\",\"JAIMINHO_URL\":\"http:\\/\\/internal.jaiminho.bbrands.com.br\",\"FREIGHT_SOURCES_8S_DEFAULT\":\"8S-02\",\"FREIGHT_SOURCES_VP_DEFAULT\":\"VP-06\",\"FREIGHT_SOURCES_VP_SP\":\"VP-01\",\"FREIGHT_SOURCES_8S_RJ\":\"8S-03\",\"FREIGHT_SOURCES_VP_RJ\":\"VP-03\",\"STARK_URL\":\"http:\\/\\/internal.stark.bbrands.com.br\",\"BUILD_URL\":\"https:\\/\\/storage.googleapis.com\\/bbrands-optimus-build\",\"AWS_S3_ACCESS_KEY\":\"GOOGICLU52HYDB74MNM7QE6U\",\"AWS_S3_SECRET_KEY\":\"bj6\\/Ar4sYMc+U1cMqV3LwRZyp+XFBfo3rSfGtyIk\",\"AWS_S3_REGION\":\"us-east4\",\"AWS_S3_BUCKET\":\"bbrands-optimus-build\",\"RECAPTCHA_SITE_KEY\":\"6LcYZGEUAAAAAKLTb067xn-XYxa155HwyHR9STLv\",\"RECAPTCHA_SECRET_KEY\":\"6LcYZGEUAAAAAPNnnw6GQ6sXIr8bcHzy9LaeMDTX\",\"ZENDESK_USERNAME_HCSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_HCSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_HCSITE\":\"https:\\/\\/triptomax.zendesk.com\",\"ZENDESK_USERNAME_SCSITE\":\"felipe.sulimam@slimcaps.com.br\",\"ZENDESK_TOKEN_SCSITE\":\"nRQFBxDuewFfhPcfkbhLmfrlxKWGa0rDN65Z07Kl\",\"ZENDESK_URL_SCSITE\":\"https:\\/\\/slimcaps.zendesk.com\",\"ZENDESK_USERNAME_BYSITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYSITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYSITE\":\"https:\\/\\/beyoung.zendesk.com\",\"ZENDESK_USERNAME_BYISITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYISITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYISITE\":\"https:\\/\\/beyoung.zendesk.com\",\"ZENDESK_USERNAME_TMSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_TMSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_TMSITE\":\"https:\\/\\/triptomax.zendesk.com\",\"ZENDESK_USERNAME_MBSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_MBSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_MBSITE\":\"https:\\/\\/triptomax.zendesk.com\",\"ZENDESK_USERNAME_P4ESITE\":\"atendimento@platinum4ever.com.br\",\"ZENDESK_TOKEN_P4ESITE\":\"pZHSi9HMcub46c8cd2A6PtLrfQBtg8ens39BR5YA\",\"ZENDESK_URL_P4ESITE\":\"https:\\/\\/platinum4ever.zendesk.com\",\"ZENDESK_USERNAME_BCSITE\":\"atendimento@haircaps.com.br\",\"ZENDESK_TOKEN_BCSITE\":\"03tIo1DtrWNmqWrWoo7SV3jWzhHIiGCrtumlic0b\",\"ZENDESK_URL_BCSITE\":\"https:\\/\\/haircaps.zendesk.com\",\"ZENDESK_USERNAME_4EBSITE\":\"\",\"ZENDESK_TOKEN_4EBSITE\":\"\",\"ZENDESK_URL_4EBSITE\":\"\",\"ZENDESK_USERNAME_4EGSITE\":\"\",\"ZENDESK_TOKEN_4EGSITE\":\"\",\"ZENDESK_URL_4EGSITE\":\"\",\"ZENDESK_USERNAME_4EMSITE\":\"\",\"ZENDESK_TOKEN_4EMSITE\":\"\",\"ZENDESK_URL_4EMSITE\":\"\",\"ZENDESK_USERNAME_4EDSITE\":\"\",\"ZENDESK_TOKEN_4EDSITE\":\"\",\"ZENDESK_URL_4EDSITE\":\"\",\"FURY_URL\":\"http:\\/\\/internal.fury.bbrands.com.br\",\"AWS_S3_ENDPOINT\":\"https:\\/\\/storage.googleapis.com\",\"GCP_BIGQUERY_PROJECT_ID\":\"bbrands-production\",\"GCP_BIGQUERY_BUCKET\":\"bbrands-optimus-bigquery\",\"GCP_BIGQUERY_DB\":\"optimus\",\"GCP_BIGQUERY_URL_TABLE\":\"tracking\",\"REDIS_TRACE_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_TRACE_PORT\":\"6379\",\"REDIS_TRACE_DB\":\"6\",\"FREIGHT_SOURCES_8S_RS\":\"8S-04\",\"PAGSEGURO_EMAIL\":\"felipe.sulimam@slimcaps.com.br\",\"PAGSEGURO_TOKEN\":\"ACAB312D0F994154A51D5C3431FE2282\",\"STORE_GTM_CODE_HCSITE\":\"GTM-K3VHHNL\",\"REDIS_CACHE_EMAIL_HOST\":\"redis.cache.bbrands.com.br\",\"REDIS_CACHE_EMAIL_PORT\":\"6379\",\"REDIS_CACHE_EMAIL_DB\":\"10\",\"SLACK_CHANNEL\":\"logger-optimus\",\"FREIGHT_SOURCES_8S_MG\":\"8S-09\",\"FREIGHT_SOURCES_8S_BA\":\"8S-06\",\"FREIGHT_SOURCES_8S_GO\":\"8S-05\",\"FREIGHT_SOURCES_8S_DF\":\"8S-08\",\"GCP_BIGQUERY_URL_NPS_TABLE\":\"nps\",\"REDIS_NPS_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_NPS_PORT\":\"6379\",\"REDIS_NPS_DB\":\"4\",\"JO_URL\":\"http:\\/\\/internal.jo.bbrands.com.br\",\"FREIGHT_SOURCES_8S_SP\":\"8S-02\",\"NEWSLETTER_SQS_SECRET_ACCESS_KEY\":\"hH95llcey+Hz8wEh4ThMhWc5OnPcF2TBA7S6x+Pc\",\"NEWSLETTER_SQS_ACCESS_KEY_ID\":\"AKIAJ2FDL6IZJRD5RNZA\",\"NEWSLETTER_SQS_REGION\":\"sa-east-1\",\"NEWSLETTER_SQS_URL\":\"https:\\/\\/sqs.sa-east-1.amazonaws.com\\/457003475386\\/email_handler\",\"COLLECTOR_URL\":\"http:\\/\\/collector.bbrands.com.br\",\"USE_COLLECTOR\":\"1\",\"STORE_GTM_CODE_BY_CART\":\"GTM-KCXJ4P\",\"HEIMDALL_URL\":\"https:\\/\\/heimdall.bbrands.com.br\",\"HEIMDALL_LOGIN\":\"optimus\",\"HEIMDALL_PASS\":\"xzeEGAnN9nPgdnDk\",\"GANDALF_URL\":\"https:\\/\\/gandalf.bbrands.com.br\",\"PAINEL_URL\":\"http:\\/\\/painel.the8co.com.br\",\"JWT_KEY\":\"NKrr69h6ecEvHtEa\",\"ZENDESK_USERNAME_BY_CART\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BY_CART\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BY_CART\":\"https:\\/\\/beyoung.zendesk.com\",\"GANDALF_LOGIN\":\"optimus@bbrands.com.br\",\"GANDALF_PASS\":\"xzeEGAnN9nPgdnDk\",\"EXTERNAL_INTEGRATION_COLOR_ID_URL\":\"https:\\/\\/beyoung.com.br\\/api\\/external-integration-open\",\"EXTERNAL_INTEGRATION_COLOR_ID_APP_URL\":\"https:\\/\\/colorid.ai\\/colorid\\/2\",\"EXTERNAL_INTEGRATION_COLOR_ID_CALLBACK_URL\":\"https:\\/\\/beyoung.com.br\\/api\\/color-id\",\"DOC_URL\":\"http:\\/\\/doc.bbrands.com.br\",\"DB_TYPE\":\"mysql\",\"DB_HOST\":\"internal.marvel.bbrands.com.br\",\"DB_PORT\":\"3306\",\"DB_USERNAME\":\"optimus\",\"DB_PASSWORD\":\"CuY57BevdcQ4f7hh^$kAwSdX@vKmd,\"DB_DATABASE\":\"optimus\",\"DB_CHARSET\":\"utf8mb4\",\"DB_DEFAULT_ENGINE\":\"InnoDB\",\"DB_LOGGING\":\"false\",\"REDIS_CACHE_HOST\":\"\",\"REDIS_CACHE_PORT\":\"6379\",\"REDIS_CACHE_DB\":\"0\",\"PACKAGE_DEFAULT_WEIGHT\":\"106\",\"STORE_GTM_CODE_BYPSITE\":\"GTM-KCXJ4P\",\"LUCIUS_URL\":\"http:\\/\\/internal.lucius.bbrands.com.br\"}"
ntr
redis-cli -h redis.staging.bbrands.com.br SET OPTIMUS:OPTIMUS_PRODUCTION "{\"REDIS_CART_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_CART_PORT\":\"6379\",\"REDIS_CART_DB\":\"8\",\"ELASTICSEARCH_LOG_HOST\":\"internal.es.bbrands.com.br\",\"ELASTICSEARCH_LOG_PORT\":\"80\",\"ELASTICSEARCH_LOG_LEVEL\":\"\",\"SLACK_WEBHOOK_URL\":\"https:\\/\\/hooks.slack.com\\/services\\/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\",\"MEGAN_URL\":\"http:\\/\\/internal.megan.bbrands.com.br\",\"ELAV_API_URL\":\"http:\\/\\/internal.api.bbrands.com.br\",\"ELAV_USERNAME\":\"mybeautycaps\",\"ELAV_PASSWORD\":\"slimcaps123@\",\"BULK_KEY\":\"NPdfEyChUbF54VLSw3qov8eTxB7GQuaY\",\"JAIMINHO_URL\":\"http:\\/\\/internal.jaiminho.bbrands.com.br\",\"FREIGHT_SOURCES_8S_DEFAULT\":\"8S-02\",\"FREIGHT_SOURCES_VP_DEFAULT\":\"VP-06\",\"FREIGHT_SOURCES_VP_SP\":\"VP-01\",\"FREIGHT_SOURCES_8S_RJ\":\"8S-03\",\"FREIGHT_SOURCES_VP_RJ\":\"VP-03\",\"STARK_URL\":\"http:\\/\\/internal.stark.bbrands.com.br\",\"BUILD_URL\":\"https:\\/\\/storage.googleapis.com\\/bbrands-optimus-build\",\"AWS_S3_ACCESS_KEY\":\"GOOGICLU52HYDB74MNM7QE6U\",\"AWS_S3_SECRET_KEY\":\"bj6\\/Ar4sYMc+U1cMqV3LwRZyp+XFBfo3rSfGtyIk\",\"AWS_S3_REGION\":\"us-east4\",\"AWS_S3_BUCKET\":\"bbrands-optimus-build\",\"RECAPTCHA_SITE_KEY\":\"6LcYZGEUAAAAAKLTb067xn-XYxa155HwyHR9STLv\",\"RECAPTCHA_SECRET_KEY\":\"6LcYZGEUAAAAAPNnnw6GQ6sXIr8bcHzy9LaeMDTX\",\"ZENDESK_USERNAME_HCSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_HCSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_HCSITE\":\"https:\\/\\/triptomax.zendesk.com\",\"ZENDESK_USERNAME_SCSITE\":\"felipe.sulimam@slimcaps.com.br\",\"ZENDESK_TOKEN_SCSITE\":\"nRQFBxDuewFfhPcfkbhLmfrlxKWGa0rDN65Z07Kl\",\"ZENDESK_URL_SCSITE\":\"https:\\/\\/slimcaps.zendesk.com\",\"ZENDESK_USERNAME_BYSITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYSITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYSITE\":\"https:\\/\\/beyoung.zendesk.com\",\"ZENDESK_USERNAME_BYISITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYISITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYISITE\":\"https:\\/\\/beyoung.zendesk.com\",\"ZENDESK_USERNAME_TMSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_TMSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_TMSITE\":\"https:\\/\\/triptomax.zendesk.com\",\"ZENDESK_USERNAME_MBSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_MBSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_MBSITE\":\"https:\\/\\/triptomax.zendesk.com\",\"ZENDESK_USERNAME_P4ESITE\":\"atendimento@platinum4ever.com.br\",\"ZENDESK_TOKEN_P4ESITE\":\"pZHSi9HMcub46c8cd2A6PtLrfQBtg8ens39BR5YA\",\"ZENDESK_URL_P4ESITE\":\"https:\\/\\/platinum4ever.zendesk.com\",\"ZENDESK_USERNAME_BCSITE\":\"atendimento@haircaps.com.br\",\"ZENDESK_TOKEN_BCSITE\":\"03tIo1DtrWNmqWrWoo7SV3jWzhHIiGCrtumlic0b\",\"ZENDESK_URL_BCSITE\":\"https:\\/\\/haircaps.zendesk.com\",\"ZENDESK_USERNAME_4EBSITE\":\"\",\"ZENDESK_TOKEN_4EBSITE\":\"\",\"ZENDESK_URL_4EBSITE\":\"\",\"ZENDESK_USERNAME_4EGSITE\":\"\",\"ZENDESK_TOKEN_4EGSITE\":\"\",\"ZENDESK_URL_4EGSITE\":\"\",\"ZENDESK_USERNAME_4EMSITE\":\"\",\"ZENDESK_TOKEN_4EMSITE\":\"\",\"ZENDESK_URL_4EMSITE\":\"\",\"ZENDESK_USERNAME_4EDSITE\":\"\",\"ZENDESK_TOKEN_4EDSITE\":\"\",\"ZENDESK_URL_4EDSITE\":\"\",\"FURY_URL\":\"http:\\/\\/internal.fury.bbrands.com.br\",\"AWS_S3_ENDPOINT\":\"https:\\/\\/storage.googleapis.com\",\"GCP_BIGQUERY_PROJECT_ID\":\"bbrands-production\",\"GCP_BIGQUERY_BUCKET\":\"bbrands-optimus-bigquery\",\"GCP_BIGQUERY_DB\":\"optimus\",\"GCP_BIGQUERY_URL_TABLE\":\"tracking\",\"REDIS_TRACE_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_TRACE_PORT\":\"6379\",\"REDIS_TRACE_DB\":\"6\",\"FREIGHT_SOURCES_8S_RS\":\"8S-04\",\"PAGSEGURO_EMAIL\":\"felipe.sulimam@slimcaps.com.br\",\"PAGSEGURO_TOKEN\":\"ACAB312D0F994154A51D5C3431FE2282\",\"STORE_GTM_CODE_HCSITE\":\"GTM-K3VHHNL\",\"REDIS_CACHE_EMAIL_HOST\":\"redis.cache.bbrands.com.br\",\"REDIS_CACHE_EMAIL_PORT\":\"6379\",\"REDIS_CACHE_EMAIL_DB\":\"10\",\"SLACK_CHANNEL\":\"logger-optimus\",\"FREIGHT_SOURCES_8S_MG\":\"8S-09\",\"FREIGHT_SOURCES_8S_BA\":\"8S-06\",\"FREIGHT_SOURCES_8S_GO\":\"8S-05\",\"FREIGHT_SOURCES_8S_DF\":\"8S-08\",\"GCP_BIGQUERY_URL_NPS_TABLE\":\"nps\",\"REDIS_NPS_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_NPS_PORT\":\"6379\",\"REDIS_NPS_DB\":\"4\",\"JO_URL\":\"http:\\/\\/internal.jo.bbrands.com.br\",\"FREIGHT_SOURCES_8S_SP\":\"8S-02\",\"NEWSLETTER_SQS_SECRET_ACCESS_KEY\":\"hH95llcey+Hz8wEh4ThMhWc5OnPcF2TBA7S6x+Pc\",\"NEWSLETTER_SQS_ACCESS_KEY_ID\":\"AKIAJ2FDL6IZJRD5RNZA\",\"NEWSLETTER_SQS_REGION\":\"sa-east-1\",\"NEWSLETTER_SQS_URL\":\"https:\\/\\/sqs.sa-east-1.amazonaws.com\\/457003475386\\/email_handler\",\"COLLECTOR_URL\":\"http:\\/\\/collector.bbrands.com.br\",\"USE_COLLECTOR\":\"1\",\"STORE_GTM_CODE_BY_CART\":\"GTM-KCXJ4P\",\"HEIMDALL_URL\":\"https:\\/\\/heimdall.bbrands.com.br\",\"HEIMDALL_LOGIN\":\"optimus\",\"HEIMDALL_PASS\":\"xzeEGAnN9nPgdnDk\",\"GANDALF_URL\":\"https:\\/\\/gandalf.bbrands.com.br\",\"PAINEL_URL\":\"http:\\/\\/painel.the8co.com.br\",\"JWT_KEY\":\"NKrr69h6ecEvHtEa\",\"ZENDESK_USERNAME_BY_CART\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BY_CART\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BY_CART\":\"https:\\/\\/beyoung.zendesk.com\",\"GANDALF_LOGIN\":\"optimus@bbrands.com.br\",\"GANDALF_PASS\":\"xzeEGAnN9nPgdnDk\",\"EXTERNAL_INTEGRATION_COLOR_ID_URL\":\"https:\\/\\/beyoung.com.br\\/api\\/external-integration-open\",\"EXTERNAL_INTEGRATION_COLOR_ID_APP_URL\":\"https:\\/\\/colorid.ai\\/colorid\\/2\",\"EXTERNAL_INTEGRATION_COLOR_ID_CALLBACK_URL\":\"https:\\/\\/beyoung.com.br\\/api\\/color-id\",\"DOC_URL\":\"http:\\/\\/doc.bbrands.com.br\",\"DB_TYPE\":\"mysql\",\"DB_HOST\":\"internal.marvel.bbrands.com.br\",\"DB_PORT\":\"3306\",\"DB_USERNAME\":\"optimus\",\"DB_PASSWORD\":\"CuY57BevdcQ4f7hh^$kAwSdX@vKmd,\"DB_DATABASE\":\"optimus\",\"DB_CHARSET\":\"utf8mb4\",\"DB_DEFAULT_ENGINE\":\"InnoDB\",\"DB_LOGGING\":\"false\",\"REDIS_CACHE_HOST\":\"\",\"REDIS_CACHE_PORT\":\"6379\",\"REDIS_CACHE_DB\":\"0\",\"PACKAGE_DEFAULT_WEIGHT\":\"106\",\"STORE_GTM_CODE_BYPSITE\":\"GTM-KCXJ4P\",\"LUCIUS_URL\":\"http:\\/\\/internal.lucius.bbrands.com.br\"}"
ntr
redis-cli -h redis.staging.bbrands.com.br SET OPTIMUS:OPTIMUS_INTERNAL_PRODUCTION "{\"REDIS_CART_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_CART_PORT\":\"6379\",\"REDIS_CART_DB\":\"8\",\"ELASTICSEARCH_LOG_HOST\":\"internal.es.bbrands.com.br\",\"ELASTICSEARCH_LOG_PORT\":\"80\",\"ELASTICSEARCH_LOG_LEVEL\":\"\",\"SLACK_WEBHOOK_URL\":\"https:\g\/hooks.slack.com\\/services\\/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\",\"MEGAN_URL\":\"http:\\/\\/internal.megan.bbrands.com.br\",\"ELAV_API_URL\":\"http:\\/\\/internal.api.bbrands.com.br\",\"ELAV_USERNAME\":\"mybeautycaps\",\"ELAV_PASSWORD\":\"slimcaps123@\",\"BULK_KEY\":\"NPdfEyChUbF54VLSw3qov8eTxB7GQuaY\",\"JAIMINHO_URL\":\"http:\\/\\/internal.jaiminho.bbrands.com.br\",\"FREIGHT_SOURCES_8S_DEFAULT\":…

redis-cli -h redis.staging.bbrands.com.br SET OPTIMUS:OPTIMUS_INTERNAL_PRODUCTION "{\"REDIS_CART_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_CART_PORT\":\"6379\",\"REDIS_CART_DB\":\"8\",\"ELASTICSEARCH_LOG_HOST\":\"internal.es.bbrands.com.br\",\"ELASTICSEARCH_LOG_PORT\":\"80\",\"ELASTICSEARCH_LOG_LEVEL\":\"\",\"SLACK_WEBHOOK_URL\":\"https:\g\/hooks.slack.com\\/services\\/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\",\"MEGAN_URL\":\"http:\\/\\/internal.megan.bbrands.com.br\",\"ELAV_API_URL\":\"http:\\/\\/internal.api.bbrands.com.br\",\"ELAV_USERNAME\":\"mybeautycaps\",\"ELAV_PASSWORD\":\"slimcaps123@\",\"BULK_KEY\":\"NPdfEyChUbF54VLSw3qov8eTxB7GQuaY\",\"JAIMINHO_URL\":\"http:\\/\\/internal.jaiminho.bbrands.com.br\",\"FREIGHT_SOURCES_8S_DEFAULT\":\"8S-02\",\"FREIGHT_SOURCES_VP_DEFAULT\":\"VP-06\",\"FREIGHT_SOURCES_VP_SP\":\"VP-01\",\"FREIGHT_SOURCES_8S_RJ\":\"8S-03\",\"FREIGHT_SOURCES_VP_RJ\":\"VP-03\",\"STARK_URL\":\"http:\\/\\/internal.stark.bbrands.com.br\",\"BUILD_URL\":\"https:\\/\\/storage.googleapis.com\\/bbrands-optimus-build\",\"AWS_S3_ACCESS_KEY\":\"GOOGICLU52HYDB74MNM7QE6U\",\"AWS_S3_SECRET_KEY\":\"bj6\\/Ar4sYMc+U1cMqV3LwRZyp+XFBfo3rSfGtyIk\",\"AWS_S3_REGION\":\"us-east4\",\"AWS_S3_BUCKET\":\"bbrands-optimus-build\",\"RECAPTCHA_SITE_KEY\":\"6LcYZGEUAAAAAKLTb067xn-XYxa155HwyHR9STLv\",\"RECAPTCHA_SECRET_KEY\":\"6LcYZGEUAAAAAPNnnw6GQ6sXIr8bcHzy9LaeMDTX\",\"ZENDESK_USERNAME_HCSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_HCSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_HCSITE\":\"https:\\/\\/triptomax.zendesk.com\",\"ZENDESK_USERNAME_SCSITE\":\"felipe.sulimam@slimcaps.com.br\",\"ZENDESK_TOKEN_SCSITE\":\"nRQFBxDuewFfhPcfkbhLmfrlxKWGa0rDN65Z07Kl\",\"ZENDESK_URL_SCSITE\":\"https:\\/\\/slimcaps.zendesk.com\",\"ZENDESK_USERNAME_BYSITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYSITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYSITE\":\"https:\\/\\/beyoung.zendesk.com\",\"ZENDESK_USERNAME_BYISITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYISITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYISITE\":\"https:\\/\\/beyoung.zendesk.com\",\"ZENDESK_USERNAME_TMSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_TMSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_TMSITE\":\"https:\\/\\/triptomax.zendesk.com\",\"ZENDESK_USERNAME_MBSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_MBSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_MBSITE\":\"https:\\/\\/triptomax.zendesk.com\",\"ZENDESK_USERNAME_P4ESITE\":\"atendimento@platinum4ever.com.br\",\"ZENDESK_TOKEN_P4ESITE\":\"pZHSi9HMcub46c8cd2A6PtLrfQBtg8ens39BR5YA\",\"ZENDESK_URL_P4ESITE\":\"https:\\/\\/platinum4ever.zendesk.com\",\"ZENDESK_USERNAME_BCSITE\":\"atendimento@haircaps.com.br\",\"ZENDESK_TOKEN_BCSITE\":\"03tIo1DtrWNmqWrWoo7SV3jWzhHIiGCrtumlic0b\",\"ZENDESK_URL_BCSITE\":\"https:\\/\\/haircaps.zendesk.com\",\"ZENDESK_USERNAME_4EBSITE\":\"\",\"ZENDESK_TOKEN_4EBSITE\":\"\",\"ZENDESK_URL_4EBSITE\":\"\",\"ZENDESK_USERNAME_4EGSITE\":\"\",\"ZENDESK_TOKEN_4EGSITE\":\"\",\"ZENDESK_URL_4EGSITE\":\"\",\"ZENDESK_USERNAME_4EMSITE\":\"\",\"ZENDESK_TOKEN_4EMSITE\":\"\",\"ZENDESK_URL_4EMSITE\":\"\",\"ZENDESK_USERNAME_4EDSITE\":\"\",\"ZENDESK_TOKEN_4EDSITE\":\"\",\"ZENDESK_URL_4EDSITE\":\"\",\"FURY_URL\":\"http:\\/\\/internal.fury.bbrands.com.br\",\"AWS_S3_ENDPOINT\":\"https:\\/\\/storage.googleapis.com\",\"GCP_BIGQUERY_PROJECT_ID\":\"bbrands-production\",\"GCP_BIGQUERY_BUCKET\":\"bbrands-optimus-bigquery\",\"GCP_BIGQUERY_DB\":\"optimus\",\"GCP_BIGQUERY_URL_TABLE\":\"tracking\",\"REDIS_TRACE_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_TRACE_PORT\":\"6379\",\"REDIS_TRACE_DB\":\"6\",\"FREIGHT_SOURCES_8S_RS\":\"8S-04\",\"PAGSEGURO_EMAIL\":\"felipe.sulimam@slimcaps.com.br\",\"PAGSEGURO_TOKEN\":\"ACAB312D0F994154A51D5C3431FE2282\",\"STORE_GTM_CODE_HCSITE\":\"GTM-K3VHHNL\",\"REDIS_CACHE_EMAIL_HOST\":\"redis.cache.bbrands.com.br\",\"REDIS_CACHE_EMAIL_PORT\":\"6379\",\"REDIS_CACHE_EMAIL_DB\":\"10\",\"SLACK_CHANNEL\":\"logger-optimus\",\"FREIGHT_SOURCES_8S_MG\":\"8S-09\",\"FREIGHT_SOURCES_8S_BA\":\"8S-06\",\"FREIGHT_SOURCES_8S_GO\":\"8S-05\",\"FREIGHT_SOURCES_8S_DF\":\"8S-08\",\"GCP_BIGQUERY_URL_NPS_TABLE\":\"nps\",\"REDIS_NPS_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_NPS_PORT\":\"6379\",\"REDIS_NPS_DB\":\"4\",\"JO_URL\":\"http:\\/\\/internal.jo.bbrands.com.br\",\"FREIGHT_SOURCES_8S_SP\":\"8S-02\",\"NEWSLETTER_SQS_SECRET_ACCESS_KEY\":\"hH95llcey+Hz8wEh4ThMhWc5OnPcF2TBA7S6x+Pc\",\"NEWSLETTER_SQS_ACCESS_KEY_ID\":\"AKIAJ2FDL6IZJRD5RNZA\",\"NEWSLETTER_SQS_REGION\":\"sa-east-1\",\"NEWSLETTER_SQS_URL\":\"https:\\/\\/sqs.sa-east-1.amazonaws.com\\/457003475386\\/email_handler\",\"COLLECTOR_URL\":\"http:\\/\\/collector.bbrands.com.br\",\"USE_COLLECTOR\":\"1\",\"STORE_GTM_CODE_BY_CART\":\"GTM-KCXJ4P\",\"HEIMDALL_URL\":\"https:\\/\\/heimdall.bbrands.com.br\",\"HEIMDALL_LOGIN\":\"optimus\",\"HEIMDALL_PASS\":\"xzeEGAnN9nPgdnDk\",\"GANDALF_URL\":\"https:\\/\\/gandalf.bbrands.com.br\",\"PAINEL_URL\":\"http:\\/\\/painel.the8co.com.br\",\"JWT_KEY\":\"NKrr69h6ecEvHtEa\",\"ZENDESK_USERNAME_BY_CART\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BY_CART\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BY_CART\":\"https:\\/\\/beyoung.zendesk.com\",\"GANDALF_LOGIN\":\"optimus@bbrands.com.br\",\"GANDALF_PASS\":\"xzeEGAnN9nPgdnDk\",\"EXTERNAL_INTEGRATION_COLOR_ID_URL\":\"https:\\/\\/beyoung.com.br\\/api\\/external-integration-open\",\"EXTERNAL_INTEGRATION_COLOR_ID_APP_URL\":\"https:\\/\\/colorid.ai\\/colorid\\/2\",\"EXTERNAL_INTEGRATION_COLOR_ID_CALLBACK_URL\":\"https:\\/\\/beyoung.com.br\\/api\\/color-id\",\"DOC_URL\":\"http:\\/\\/doc.bbrands.com.br\",\"DB_TYPE\":\"mysql\",\"DB_HOST\":\"internal.marvel.bbrands.com.br\",\"DB_PORT\":\"3306\",\"DB_USERNAME\":\"optimus\",\"DB_PASSWORD\":\"CuY57BevdcQ4f7hh^$kAwSdX@vKmd,\"DB_DATABASE\":\"optimus\",\"DB_CHARSET\":\"utf8mb4\",\"DB_DEFAULT_ENGINE\":\"InnoDB\",\"DB_LOGGING\":\"false\",\"REDIS_CACHE_HOST\":\"\",\"REDIS_CACHE_PORT\":\"6379\",\"REDIS_CACHE_DB\":\"0\",\"PACKAGE_DEFAULT_WEIGHT\":\"106\",\"STORE_GTM_CODE_BYPSITE\":\"GTM-KCXJ4P\",\"LUCIUS_URL\":\"http:\\/\\/internal.lucius.bbrands.com.br\"}"
redis-cli -h redis.staging.bbrands.com.br SET OPTIMUS:OPTIMUS_INTERNAL_PRODUCTION "{\"REDIS_CART_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_CART_PORT\":\"6379\",\"REDIS_CART_DB\":\"8\",\"ELASTICSEARCH_LOG_HOST\":\"internal.es.bbrands.com.br\",\"ELASTICSEARCH_LOG_PORT\":\"80\",\"ELASTICSEARCH_LOG_LEVEL\":\"\",\"SLACK_WEBHOOK_URL\":\"https:\g\\/hooks.slack.com\\/services\\/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\",\"MEGAN_URL\":\"http:\\/\\/internal.megan.bbrands.com.br\",\"ELAV_API_URL\":\"http:\\/\\/internal.api.bbrands.com.br\",\"ELAV_USERNAME\":\"mybeautycaps\",\"ELAV_PASSWORD\":\"slimcaps123@\",\"BULK_KEY\":\"NPdfEyChUbF54VLSw3qov8eTxB7GQuaY\",\"JAIMINHO_URL\":\"http:\\/\\/internal.jaiminho.bbrands.com.br\",\"FREIGHT_SOURCES_8S_DEFAULT\":\"8S-02\",\"FREIGHT_SOURCES_VP_DEFAULT\":\"VP-06\",\"FREIGHT_SOURCES_VP_SP\":\"VP-01\",\"FREIGHT_SOURCES_8S_RJ\":\"8S-03\",\"FREIGHT_SOURCES_VP_RJ\":\"VP-03\",\"STARK_URL\":\"http:\\/\\/internal.stark.bbrands.com.br\",\"BUILD_URL\":\"https:\\/\\/storage.googleapis.com\\/bbrands-optimus-build\",\"AWS_S3_ACCESS_KEY\":\"GOOGICLU52HYDB74MNM7QE6U\",\"AWS_S3_SECRET_KEY\":\"bj6\\/Ar4sYMc+U1cMqV3LwRZyp+XFBfo3rSfGtyIk\",\"AWS_S3_REGION\":\"us-east4\",\"AWS_S3_BUCKET\":\"bbrands-optimus-build\",\"RECAPTCHA_SITE_KEY\":\"6LcYZGEUAAAAAKLTb067xn-XYxa155HwyHR9STLv\",\"RECAPTCHA_SECRET_KEY\":\"6LcYZGEUAAAAAPNnnw6GQ6sXIr8bcHzy9LaeMDTX\",\"ZENDESK_USERNAME_HCSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_HCSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_HCSITE\":\"https:\\/\\/triptomax.zendesk.com\",\"ZENDESK_USERNAME_SCSITE\":\"felipe.sulimam@slimcaps.com.br\",\"ZENDESK_TOKEN_SCSITE\":\"nRQFBxDuewFfhPcfkbhLmfrlxKWGa0rDN65Z07Kl\",\"ZENDESK_URL_SCSITE\":\"https:\\/\\/slimcaps.zendesk.com\",\"ZENDESK_USERNAME_BYSITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYSITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYSITE\":\"https:\\/\\/beyoung.zendesk.com\",\"ZENDESK_USERNAME_BYISITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYISITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYISITE\":\"https:\\/\\/beyoung.zendesk.com\",\"ZENDESK_USERNAME_TMSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_TMSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_TMSITE\":\"https:\\/\\/triptomax.zendesk.com\",\"ZENDESK_USERNAME_MBSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_MBSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_MBSITE\":\"https:\\/\\/triptomax.zendesk.com\",\"ZENDESK_USERNAME_P4ESITE\":\"atendimento@platinum4ever.com.br\",\"ZENDESK_TOKEN_P4ESITE\":\"pZHSi9HMcub46c8cd2A6PtLrfQBtg8ens39BR5YA\",\"ZENDESK_URL_P4ESITE\":\"https:\\/\\/platinum4ever.zendesk.com\",\"ZENDESK_USERNAME_BCSITE\":\"atendimento@haircaps.com.br\",\"ZENDESK_TOKEN_BCSITE\":\"03tIo1DtrWNmqWrWoo7SV3jWzhHIiGCrtumlic0b\",\"ZENDESK_URL_BCSITE\":\"https:\\/\\/haircaps.zendesk.com\",\"ZENDESK_USERNAME_4EBSITE\":\"\",\"ZENDESK_TOKEN_4EBSITE\":\"\",\"ZENDESK_URL_4EBSITE\":\"\",\"ZENDESK_USERNAME_4EGSITE\":\"\",\"ZENDESK_TOKEN_4EGSITE\":\"\",\"ZENDESK_URL_4EGSITE\":\"\",\"ZENDESK_USERNAME_4EMSITE\":\"\",\"ZENDESK_TOKEN_4EMSITE\":\"\",\"ZENDESK_URL_4EMSITE\":\"\",\"ZENDESK_USERNAME_4EDSITE\":\"\",\"ZENDESK_TOKEN_4EDSITE\":\"\",\"ZENDESK_URL_4EDSITE\":\"\",\"FURY_URL\":\"http:\\/\\/internal.fury.bbrands.com.br\",\"AWS_S3_ENDPOINT\":\"https:\\/\\/storage.googleapis.com\",\"GCP_BIGQUERY_PROJECT_ID\":\"bbrands-production\",\"GCP_BIGQUERY_BUCKET\":\"bbrands-optimus-bigquery\",\"GCP_BIGQUERY_DB\":\"optimus\",\"GCP_BIGQUERY_URL_TABLE\":\"tracking\",\"REDIS_TRACE_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_TRACE_PORT\":\"6379\",\"REDIS_TRACE_DB\":\"6\",\"FREIGHT_SOURCES_8S_RS\":\"8S-04\",\"PAGSEGURO_EMAIL\":\"felipe.sulimam@slimcaps.com.br\",\"PAGSEGURO_TOKEN\":\"ACAB312D0F994154A51D5C3431FE2282\",\"STORE_GTM_CODE_HCSITE\":\"GTM-K3VHHNL\",\"REDIS_CACHE_EMAIL_HOST\":\"redis.cache.bbrands.com.br\",\"REDIS_CACHE_EMAIL_PORT\":\"6379\",\"REDIS_CACHE_EMAIL_DB\":\"10\",\"SLACK_CHANNEL\":\"logger-optimus\",\"FREIGHT_SOURCES_8S_MG\":\"8S-09\",\"FREIGHT_SOURCES_8S_BA\":\"8S-06\",\"FREIGHT_SOURCES_8S_GO\":\"8S-05\",\"FREIGHT_SOURCES_8S_DF\":\"8S-08\",\"GCP_BIGQUERY_URL_NPS_TABLE\":\"nps\",\"REDIS_NPS_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_NPS_PORT\":\"6379\",\"REDIS_NPS_DB\":\"4\",\"JO_URL\":\"http:\\/\\/internal.jo.bbrands.com.br\",\"FREIGHT_SOURCES_8S_SP\":\"8S-02\",\"NEWSLETTER_SQS_SECRET_ACCESS_KEY\":\"hH95llcey+Hz8wEh4ThMhWc5OnPcF2TBA7S6x+Pc\",\"NEWSLETTER_SQS_ACCESS_KEY_ID\":\"AKIAJ2FDL6IZJRD5RNZA\",\"NEWSLETTER_SQS_REGION\":\"sa-east-1\",\"NEWSLETTER_SQS_URL\":\"https:\\/\\/sqs.sa-east-1.amazonaws.com\\/457003475386\\/email_handler\",\"COLLECTOR_URL\":\"http:\\/\\/collector.bbrands.com.br\",\"USE_COLLECTOR\":\"1\",\"STORE_GTM_CODE_BY_CART\":\"GTM-KCXJ4P\",\"HEIMDALL_URL\":\"https:\\/\\/heimdall.bbrands.com.br\",\"HEIMDALL_LOGIN\":\"optimus\",\"HEIMDALL_PASS\":\"xzeEGAnN9nPgdnDk\",\"GANDALF_URL\":\"https:\\/\\/gandalf.bbrands.com.br\",\"PAINEL_URL\":\"http:\\/\\/painel.the8co.com.br\",\"JWT_KEY\":\"NKrr69h6ecEvHtEa\",\"ZENDESK_USERNAME_BY_CART\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BY_CART\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BY_CART\":\"https:\\/\\/beyoung.zendesk.com\",\"GANDALF_LOGIN\":\"optimus@bbrands.com.br\",\"GANDALF_PASS\":\"xzeEGAnN9nPgdnDk\",\"EXTERNAL_INTEGRATION_COLOR_ID_URL\":\"https:\\/\\/beyoung.com.br\\/api\\/external-integration-open\",\"EXTERNAL_INTEGRATION_COLOR_ID_APP_URL\":\"https:\\/\\/colorid.ai\\/colorid\\/2\",\"EXTERNAL_INTEGRATION_COLOR_ID_CALLBACK_URL\":\"https:\\/\\/beyoung.com.br\\/api\\/color-id\",\"DOC_URL\":\"http:\\/\\/doc.bbrands.com.br\",\"DB_TYPE\":\"mysql\",\"DB_HOST\":\"internal.marvel.bbrands.com.br\",\"DB_PORT\":\"3306\",\"DB_USERNAME\":\"optimus\",\"DB_PASSWORD\":\"CuY57BevdcQ4f7hh^$kAwSdX@vKmd,\"DB_DATABASE\":\"optimus\",\"DB_CHARSET\":\"utf8mb4\",\"DB_DEFAULT_ENGINE\":\"InnoDB\",\"DB_LOGGING\":\"false\",\"REDIS_CACHE_HOST\":\"\",\"REDIS_CACHE_PORT\":\"6379\",\"REDIS_CACHE_DB\":\"0\",\"PACKAGE_DEFAULT_WEIGHT\":\"106\",\"STORE_GTM_CODE_BYPSITE\":\"GTM-KCXJ4P\",\"LUCIUS_URL\":\"http:\\/\\/internal.lucius.bbrands.com.br\"}"
ntr
redis-cli -h redis.staging.bbrands.com.br SET OPTIMUS:OPTIMUS_INTERNAL_PRODUCTION "{\"REDIS_CART_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_CART_PORT\":\"6379\",\"REDIS_CART_DB\":\"8\",\"ELASTICSEARCH_LOG_HOST\":\"internal.es.bbrands.com.br\",\"ELASTICSEARCH_LOG_PORT\":\"80\",\"ELASTICSEARCH_LOG_LEVEL\":\"\",\"SLACK_WEBHOOK_URL\":\"https://hooks.slack.com/services/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\",\"MEGAN_URL\":\"http://internal.megan.bbrands.com.br\",\"ELAV_API_URL\":\"http://internal.api.bbrands.com.br\",\"ELAV_USERNAME\":\"mybeautycaps\",\"ELAV_PASSWORD\":\"slimcaps123@\",\"BULK_KEY\":\"NPdfEyChUbF54VLSw3qov8eTxB7GQuaY\",\"JAIMINHO_URL\":\"http://internal.jaiminho.bbrands.com.br\",\"FREIGHT_SOURCES_8S_DEFAULT\":\"8S-02\",\"FREIGHT_SOURCES_VP_DEFAULT\":\"VP-06\",\"FREIGHT_SOURCES_VP_SP\":\"VP-01\",\"FREIGHT_SOURCES_8S_RJ\":\"8S-03\",\"FREIGHT_SOURCES_VP_RJ\":\"VP-03\",\"STARK_URL\":\"http://internal.stark.bbrands.com.br\",\"BUILD_URL\":\"https://storage.googleapis.com/bbrands-optimus-build\",\"AWS_S3_ACCESS_KEY\":\"GOOGICLU52HYDB74MNM7QE6U\",\"AWS_S3_SECRET_KEY\":\"bj6/Ar4sYMc+U1cMqV3LwRZyp+XFBfo3rSfGtyIk\",\"AWS_S3_REGION\":\"us-east4\",\"AWS_S3_BUCKET\":\"bbrands-optimus-build\",\"RECAPTCHA_SITE_KEY\":\"6LcYZGEUAAAAAKLTb067xn-XYxa155HwyHR9STLv\",\"RECAPTCHA_SECRET_KEY\":\"6LcYZGEUAAAAAPNnnw6GQ6sXIr8bcHzy9LaeMDTX\",\"ZENDESK_USERNAME_HCSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_HCSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_HCSITE\":\"https://triptomax.zendesk.com\",\"ZENDESK_USERNAME_SCSITE\":\"felipe.sulimam@slimcaps.com.br\",\"ZENDESK_TOKEN_SCSITE\":\"nRQFBxDuewFfhPcfkbhLmfrlxKWGa0rDN65Z07Kl\",\"ZENDESK_URL_SCSITE\":\"https://slimcaps.zendesk.com\",\"ZENDESK_USERNAME_BYSITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYSITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYSITE\":\"https://beyoung.zendesk.com\",\"ZENDESK_USERNAME_BYISITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYISITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYISITE\":\"https://beyoung.zendesk.com\",\"ZENDESK_USERNAME_TMSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_TMSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_TMSITE\":\"https://triptomax.zendesk.com\",\"ZENDESK_USERNAME_MBSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_MBSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_MBSITE\":\"https://triptomax.zendesk.com\",\"ZENDESK_USERNAME_P4ESITE\":\"atendimento@platinum4ever.com.br\",\"ZENDESK_TOKEN_P4ESITE\":\"pZHSi9HMcub46c8cd2A6PtLrfQBtg8ens39BR5YA\",\"ZENDESK_URL_P4ESITE\":\"https://platinum4ever.zendesk.com\",\"ZENDESK_USERNAME_BCSITE\":\"atendimento@haircaps.com.br\",\"ZENDESK_TOKEN_BCSITE\":\"03tIo1DtrWNmqWrWoo7SV3jWzhHIiGCrtumlic0b\",\"ZENDESK_URL_BCSITE\":\"https://haircaps.zendesk.com\",\"ZENDESK_USERNAME_4EBSITE\":\"\",\"ZENDESK_TOKEN_4EBSITE\":\"\",\"ZENDESK_URL_4EBSITE\":\"\",\"ZENDESK_USERNAME_4EGSITE\":\"\",\"ZENDESK_TOKEN_4EGSITE\":\"\",\"ZENDESK_URL_4EGSITE\":\"\",\"ZENDESK_USERNAME_4EMSITE\":\"\",\"ZENDESK_TOKEN_4EMSITE\":\"\",\"ZENDESK_URL_4EMSITE\":\"\",\"ZENDESK_USERNAME_4EDSITE\":\"\",\"ZENDESK_TOKEN_4EDSITE\":\"\",\"ZENDESK_URL_4EDSITE\":\"\",\"FURY_URL\":\"http://internal.fury.bbrands.com.br\",\"AWS_S3_ENDPOINT\":\"https://storage.googleapis.com\",\"GCP_BIGQUERY_PROJECT_ID\":\"bbrands-production\",\"GCP_BIGQUERY_BUCKET\":\"bbrands-optimus-bigquery\",\"GCP_BIGQUERY_DB\":\"optimus\",\"GCP_BIGQUERY_URL_TABLE\":\"tracking\",\"REDIS_TRACE_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_TRACE_PORT\":\"6379\",\"REDIS_TRACE_DB\":\"6\",\"FREIGHT_SOURCES_8S_RS\":\"8S-04\",\"PAGSEGURO_EMAIL\":\"felipe.sulimam@slimcaps.com.br\",\"PAGSEGURO_TOKEN\":\"ACAB312D0F994154A51D5C3431FE2282\",\"STORE_GTM_CODE_HCSITE\":\"GTM-K3VHHNL\",\"REDIS_CACHE_EMAIL_HOST\":\"redis.cache.bbrands.com.br\",\"REDIS_CACHE_EMAIL_PORT\":\"6379\",\"REDIS_CACHE_EMAIL_DB\":\"10\",\"SLACK_CHANNEL\":\"logger-optimus\",\"FREIGHT_SOURCES_8S_MG\":\"8S-09\",\"FREIGHT_SOURCES_8S_BA\":\"8S-06\",\"FREIGHT_SOURCES_8S_GO\":\"8S-05\",\"FREIGHT_SOURCES_8S_DF\":\"8S-08\",\"GCP_BIGQUERY_URL_NPS_TABLE\":\"nps\",\"REDIS_NPS_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_NPS_PORT\":\"6379\",\"REDIS_NPS_DB\":\"4\",\"JO_URL\":\"http://internal.jo.bbrands.com.br\",\"FREIGHT_SOURCES_8S_SP\":\"8S-02\",\"NEWSLETTER_SQS_SECRET_ACCESS_KEY\":\"hH95llcey+Hz8wEh4ThMhWc5OnPcF2TBA7S6x+Pc\",\"NEWSLETTER_SQS_ACCESS_KEY_ID\":\"AKIAJ2FDL6IZJRD5RNZA\",\"NEWSLETTER_SQS_REGION\":\"sa-east-1\",\"NEWSLETTER_SQS_URL\":\"https://sqs.sa-east-1.amazonaws.com/457003475386/email_handler\",\"COLLECTOR_URL\":\"http://collector.bbrands.com.br\",\"USE_COLLECTOR\":\"1\",\"STORE_GTM_CODE_BY_CART\":\"GTM-KCXJ4P\",\"HEIMDALL_URL\":\"https://heimdall.bbrands.com.br\",\"HEIMDALL_LOGIN\":\"optimus\",\"HEIMDALL_PASS\":\"xzeEGAnN9nPgdnDk\",\"GANDALF_URL\":\"https://gandalf.bbrands.com.br\",\"PAINEL_URL\":\"http://painel.the8co.com.br\",\"JWT_KEY\":\"NKrr69h6ecEvHtEa\",\"ZENDESK_USERNAME_BY_CART\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BY_CART\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BY_CART\":\"https://beyoung.zendesk.com\",\"GANDALF_LOGIN\":\"optimus@bbrands.com.br\",\"GANDALF_PASS\":\"xzeEGAnN9nPgdnDk\",\"EXTERNAL_INTEGRATION_COLOR_ID_URL\":\"https://beyoung.com.br/api/external-integration-open\",\"EXTERNAL_INTEGRATION_COLOR_ID_APP_URL\":\"https://colorid.ai/colorid/2\",\"EXTERNAL_INTEGRATION_COLOR_ID_CALLBACK_URL\":\"https://beyoung.com.br/api/color-id\",\"DOC_URL\":\"http://doc.bbrands.com.br\",\"DB_TYPE\":\"mysql\",\"DB_HOST\":\"internal.marvel.bbrands.com.br\",\"DB_PORT\":\"3306\",\"DB_USERNAME\":\"optimus\",\"DB_PASSWORD\":\"CuY57BevdcQ4f7hh^$kAwSdX@vKmd,\"DB_DATABASE\":\"optimus\",\"DB_CHARSET\":\"utf8mb4\",\"DB_DEFAULT_ENGINE\":\"InnoDB\",\"DB_LOGGING\":\"false\",\"REDIS_CACHE_HOST\":\"\",\"REDIS_CACHE_PORT\":\"6379\",\"REDIS_CACHE_DB\":\"0\",\"PACKAGE_DEFAULT_WEIGHT\":\"106\",\"STORE_GTM_CODE_BYPSITE\":\"GTM-KCXJ4P\",\"LUCIUS_URL\":\"http://internal.lucius.bbrands.com.br\"}"
ntr
redis-cli -h redis.staging.bbrands.com.br SET OPTIMUS:OPTIMUS_INTERNAL_PRODUCTION "{\"REDIS_CART_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_CART_PORT\":\"6379\",\"REDIS_CART_DB\":\"8\",\"ELASTICSEARCH_LOG_HOST\":\"internal.es.bbrands.com.br\",\"ELASTICSEARCH_LOG_PORT\":\"80\",\"ELASTICSEARCH_LOG_LEVEL\":\"\",\"SLACK_WEBHOOK_URL\":\"https://hooks.slack.com/services/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\",\"MEGAN_URL\":\"http://internal.megan.bbrands.com.br\",\"ELAV_API_URL\":\"http://internal.api.bbrands.com.br\",\"ELAV_USERNAME\":\"mybeautycaps\",\"ELAV_PASSWORD\":\"slimcaps123@\",\"BULK_KEY\":\"NPdfEyChUbF54VLSw3qov8eTxB7GQuaY\",\"JAIMINHO_URL\":\"http://internal.jaiminho.bbrands.com.br\",\"FREIGHT_SOURCES_8S_DEFAULT\":\"8S-02\",\"FREIGHT_SOURCES_VP_DEFAULT\":\"VP-06\",\"FREIGHT_SOURCES_VP_SP\":\"VP-01\",\"FREIGHT_SOURCES_8S_RJ\":\"8S-03\",\"FREIGHT_SOURCES_VP_RJ\":\"VP-03\",\"STARK_URL\":\"http://internal.stark.bbrands.com.br\",\"BUILD_URL\":\"https://storage.googleapis.com/bbrands-optimus-build\",\"AWS_S3_ACCESS_KEY\":\"GOOGICLU52HYDB74MNM7QE6U\",\"AWS_S3_SECRET_KEY\":\"bj6/Ar4sYMc+U1cMqV3LwRZyp+XFBfo3rSfGtyIk\",\"AWS_S3_REGION\":\"us-east4\",\"AWS_S3_BUCKET\":\"bbrands-optimus-build\",\"RECAPTCHA_SITE_KEY\":\"6LcYZGEUAAAAAKLTb067xn-XYxa155HwyHR9STLv\",\"RECAPTCHA_SECRET_KEY\":\"6LcYZGEUAAAAAPNnnw6GQ6sXIr8bcHzy9LaeMDTX\",\"ZENDESK_USERNAME_HCSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_HCSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_HCSITE\":\"https://triptomax.zendesk.com\",\"ZENDESK_USERNAME_SCSITE\":\"felipe.sulimam@slimcaps.com.br\",\"ZENDESK_TOKEN_SCSITE\":\"nRQFBxDuewFfhPcfkbhLmfrlxKWGa0rDN65Z07Kl\",\"ZENDESK_URL_SCSITE\":\"https://slimcaps.zendesk.com\",\"ZENDESK_USERNAME_BYSITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYSITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYSITE\":\"https://beyoung.zendesk.com\",\"ZENDESK_USERNAME_BYISITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYISITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYISITE\":\"https://beyoung.zendesk.com\",\"ZENDESK_USERNAME_TMSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_TMSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_TMSITE\":\"https://triptomax.zendesk.com\",\"ZENDESK_USERNAME_MBSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_MBSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_MBSITE\":\"https://triptomax.zendesk.com\",\"ZENDESK_USERNAME_P4ESITE\":\"atendimento@platinum4ever.com.br\",\"ZENDESK_TOKEN_P4ESITE\":\"pZHSi9HMcub46c8cd2A6PtLrfQBtg8ens39BR5YA\",\"ZENDESK_URL_P4ESITE\":\"https://platinum4ever.zendesk.com\",\"ZENDESK_USERNAME_BCSITE\":\"atendimento@haircaps.com.br\",\"ZENDESK_TOKEN_BCSITE\":\"03tIo1DtrWNmqWrWoo7SV3jWzhHIiGCrtumlic0b\",\"ZENDESK_URL_BCSITE\":\"https://haircaps.zendesk.com\",\"ZENDESK_USERNAME_4EBSITE\":\"\",\"ZENDESK_TOKEN_4EBSITE\":\"\",\"ZENDESK_URL_4EBSITE\":\"\",\"ZENDESK_USERNAME_4EGSITE\":\"\",\"ZENDESK_TOKEN_4EGSITE\":\"\",\"ZENDESK_URL_4EGSITE\":\"\",\"ZENDESK_USERNAME_4EMSITE\":\"\",\"ZENDESK_TOKEN_4EMSITE\":\"\",\"ZENDESK_URL_4EMSITE\":\"\",\"ZENDESK_USERNAME_4EDSITE\":\"\",\"ZENDESK_TOKEN_4EDSITE\":\"\",\"ZENDESK_URL_4EDSITE\":\"\",\"FURY_URL\":\"http://internal.fury.bbrands.com.br\",\"AWS_S3_ENDPOINT\":\"https://storage.googleapis.com\",\"GCP_BIGQUERY_PROJECT_ID\":\"bbrands-production\",\"GCP_BIGQUERY_BUCKET\":\"bbrands-optimus-bigquery\",\"GCP_BIGQUERY_DB\":\"optimus\",\"GCP_BIGQUERY_URL_TABLE\":\"tracking\",\"REDIS_TRACE_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_TRACE_PORT\":\"6379\",\"REDIS_TRACE_DB\":\"6\",\"FREIGHT_SOURCES_8S_RS\":\"8S-04\",\"PAGSEGURO_EMAIL\":\"felipe.sulimam@slimcaps.com.br\",\"PAGSEGURO_TOKEN\":\"ACAB312D0F994154A51D5C3431FE2282\",\"STORE_GTM_CODE_HCSITE\":\"GTM-K3VHHNL\",\"REDIS_CACHE_EMAIL_HOST\":\"redis.cache.bbrands.com.br\",\"REDIS_CACHE_EMAIL_PORT\":\"6379\",\"REDIS_CACHE_EMAIL_DB\":\"10\",\"SLACK_CHANNEL\":\"logger-optimus\",\"FREIGHT_SOURCES_8S_MG\":\"8S-09\",\"FREIGHT_SOURCES_8S_BA\":\"8S-06\",\"FREIGHT_SOURCES_8S_GO\":\"8S-05\",\"FREIGHT_SOURCES_8S_DF\":\"8S-08\",\"GCP_BIGQUERY_URL_NPS_TABLE\":\"nps\",\"REDIS_NPS_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_NPS_PORT\":\"6379\",\"REDIS_NPS_DB\":\"4\",\"JO_URL\":\"http://internal.jo.bbrands.com.br\",\"FREIGHT_SOURCES_8S_SP\":\"8S-02\",\"NEWSLETTER_SQS_SECRET_ACCESS_KEY\":\"hH95llcey+Hz8wEh4ThMhWc5OnPcF2TBA7S6x+Pc\",\"NEWSLETTER_SQS_ACCESS_KEY_ID\":\"AKIAJ2FDL6IZJRD5RNZA\",\"NEWSLETTER_SQS_REGION\":\"sa-east-1\",\"NEWSLETTER_SQS_URL\":\"https://sqs.sa-east-1.amazonaws.com/457003475386/email_handler\",\"COLLECTOR_URL\":\"http://collector.bbrands.com.br\",\"USE_COLLECTOR\":\"1\",\"STORE_GTM_CODE_BY_CART\":\"GTM-KCXJ4P\",\"HEIMDALL_URL\":\"https://heimdall.bbrands.com.br\",\"HEIMDALL_LOGIN\":\"optimus\",\"HEIMDALL_PASS\":\"xzeEGAnN9nPgdnDk\",\"GANDALF_URL\":\"https://gandalf.bbrands.com.br\",\"PAINEL_URL\":\"http://painel.the8co.com.br\",\"JWT_KEY\":\"NKrr69h6ecEvHtEa\",\"ZENDESK_USERNAME_BY_CART\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BY_CART\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BY_CART\":\"https://beyoung.zendesk.com\",\"GANDALF_LOGIN\":\"optimus@bbrands.com.br\",\"GANDALF_PASS\":\"xzeEGAnN9nPgdnDk\",\"EXTERNAL_INTEGRATION_COLOR_ID_URL\":\"https://beyoung.com.br/api/external-integration-open\",\"EXTERNAL_INTEGRATION_COLOR_ID_APP_URL\":\"https://colorid.ai/colorid/2\",\"EXTERNAL_INTEGRATION_COLOR_ID_CALLBACK_URL\":\"https://beyoung.com.br/api/color-id\",\"DOC_URL\":\"http://doc.bbrands.com.br\",\"DB_TYPE\":\"mysql\",\"DB_HOST\":\"internal.marvel.bbrands.com.br\",\"DB_PORT\":\"3306\",\"DB_USERNAME\":\"optimus\",\"DB_PASSWORD\":\"CuY57BevdcQ4f7hh^$kAwSdX@vKmd,\",\"DB_DATABASE\":\"optimus\",\"DB_CHARSET\":\"utf8mb4\",\"DB_DEFAULT_ENGINE\":\"InnoDB\",\"DB_LOGGING\":\"false\",\"REDIS_CACHE_HOST\":\"\",\"REDIS_CACHE_PORT\":\"6379\",\"REDIS_CACHE_DB\":\"0\",\"PACKAGE_DEFAULT_WEIGHT\":\"106\",\"STORE_GTM_CODE_BYPSITE\":\"GTM-KCXJ4P\",\"LUCIUS_URL\":\"http://internal.lucius.bbrands.com.br\"}"
ntr
redis-cli -h redis.staging.bbrands.com.br SET OPTIMUS:OPTIMUS_INTERNAL_PRODUCTION "{\"REDIS_CART_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_CART_PORT\":\"6379\",\"REDIS_CART_DB\":\"8\",\"ELASTICSEARCH_LOG_HOST\":\"internal.es.bbrands.com.br\",\"ELASTICSEARCH_LOG_PORT\":\"80\",\"ELASTICSEARCH_LOG_LEVEL\":\"\",\"SLACK_WEBHOOK_URL\":\"https://hooks.slack.com/services/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\",\"MEGAN_URL\":\"http://internal.megan.bbrands.com.br\",\"ELAV_API_URL\":\"http://internal.api.bbrands.com.br\",\"ELAV_USERNAME\":\"mybeautycaps\",\"ELAV_PASSWORD\":\"slimcaps123@\",\"BULK_KEY\":\"NPdfEyChUbF54VLSw3qov8eTxB7GQuaY\",\"JAIMINHO_URL\":\"http://internal.jaiminho.bbrands.com.br\",\"FREIGHT_SOURCES_8S_DEFAULT\":\"8S-02\",\"FREIGHT_SOURCES_VP_DEFAULT\":\"VP-06\",\"FREIGHT_SOURCES_VP_SP\":\"VP-01\",\"FREIGHT_SOURCES_8S_RJ\":\"8S-03\",\"FREIGHT_SOURCES_VP_RJ\":\"VP-03\",\"STARK_URL\":\"http://internal.stark.bbrands.com.br\",\"BUILD_URL\":\"https://storage.googleapis.com/bbrands-optimus-build\",\"AWS_S3_ACCESS_KEY\":\"GOOGICLU52HYDB74MNM7QE6U\",\"AWS_S3_SECRET_KEY\":\"bj6/Ar4sYMc+U1cMqV3LwRZyp+XFBfo3rSfGtyIk\",\"AWS_S3_REGION\":\"us-east4\",\"AWS_S3_BUCKET\":\"bbrands-optimus-build\",\"RECAPTCHA_SITE_KEY\":\"6LcYZGEUAAAAAKLTb067xn-XYxa155HwyHR9STLv\",\"RECAPTCHA_SECRET_KEY\":\"6LcYZGEUAAAAAPNnnw6GQ6sXIr8bcHzy9LaeMDTX\",\"ZENDESK_USERNAME_HCSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_HCSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_HCSITE\":\"https://triptomax.zendesk.com\",\"ZENDESK_USERNAME_SCSITE\":\"felipe.sulimam@slimcaps.com.br\",\"ZENDESK_TOKEN_SCSITE\":\"nRQFBxDuewFfhPcfkbhLmfrlxKWGa0rDN65Z07Kl\",\"ZENDESK_URL_SCSITE\":\"https://slimcaps.zendesk.com\",\"ZENDESK_USERNAME_BYSITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYSITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYSITE\":\"https://beyoung.zendesk.com\",\"ZENDESK_USERNAME_BYISITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYISITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYISITE\":\"https://beyoung.zendesk.com\",\"ZENDESK_USERNAME_TMSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_TMSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_TMSITE\":\"https://triptomax.zendesk.com\",\"ZENDESK_USERNAME_MBSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_MBSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_MBSITE\":\"https://triptomax.zendesk.com\",\"ZENDESK_USERNAME_P4ESITE\":\"atendimento@platinum4ever.com.br\",\"ZENDESK_TOKEN_P4ESITE\":\"pZHSi9HMcub46c8cd2A6PtLrfQBtg8ens39BR5YA\",\"ZENDESK_URL_P4ESITE\":\"https://platinum4ever.zendesk.com\",\"ZENDESK_USERNAME_BCSITE\":\"atendimento@haircaps.com.br\",\"ZENDESK_TOKEN_BCSITE\":\"03tIo1DtrWNmqWrWoo7SV3jWzhHIiGCrtumlic0b\",\"ZENDESK_URL_BCSITE\":\"https://haircaps.zendesk.com\",\"ZENDESK_USERNAME_4EBSITE\":\"\",\"ZENDESK_TOKEN_4EBSITE\":\"\",\"ZENDESK_URL_4EBSITE\":\"\",\"ZENDESK_USERNAME_4EGSITE\":\"\",\"ZENDESK_TOKEN_4EGSITE\":\"\",\"ZENDESK_URL_4EGSITE\":\"\",\"ZENDESK_USERNAME_4EMSITE\":\"\",\"ZENDESK_TOKEN_4EMSITE\":\"\",\"ZENDESK_URL_4EMSITE\":\"\",\"ZENDESK_USERNAME_4EDSITE\":\"\",\"ZENDESK_TOKEN_4EDSITE\":\"\",\"ZENDESK_URL_4EDSITE\":\"\",\"FURY_URL\":\"http://internal.fury.bbrands.com.br\",\"AWS_S3_ENDPOINT\":\"https://storage.googleapis.com\",\"GCP_BIGQUERY_PROJECT_ID\":\"bbrands-production\",\"GCP_BIGQUERY_BUCKET\":\"bbrands-optimus-bigquery\",\"GCP_BIGQUERY_DB\":\"optimus\",\"GCP_BIGQUERY_URL_TABLE\":\"tracking\",\"REDIS_TRACE_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_TRACE_PORT\":\"6379\",\"REDIS_TRACE_DB\":\"6\",\"FREIGHT_SOURCES_8S_RS\":\"8S-04\",\"PAGSEGURO_EMAIL\":\"felipe.sulimam@slimcaps.com.br\",\"PAGSEGURO_TOKEN\":\"ACAB312D0F994154A51D5C3431FE2282\",\"STORE_GTM_CODE_HCSITE\":\"GTM-K3VHHNL\",\"REDIS_CACHE_EMAIL_HOST\":\"redis.cache.bbrands.com.br\",\"REDIS_CACHE_EMAIL_PORT\":\"6379\",\"REDIS_CACHE_EMAIL_DB\":\"10\",\"SLACK_CHANNEL\":\"logger-optimus\",\"FREIGHT_SOURCES_8S_MG\":\"8S-09\",\"FREIGHT_SOURCES_8S_BA\":\"8S-06\",\"FREIGHT_SOURCES_8S_GO\":\"8S-05\",\"FREIGHT_SOURCES_8S_DF\":\"8S-08\",\"GCP_BIGQUERY_URL_NPS_TABLE\":\"nps\",\"REDIS_NPS_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_NPS_PORT\":\"6379\",\"REDIS_NPS_DB\":\"4\",\"JO_URL\":\"http://internal.jo.bbrands.com.br\",\"FREIGHT_SOURCES_8S_SP\":\"8S-02\",\"NEWSLETTER_SQS_SECRET_ACCESS_KEY\":\"hH95llcey+Hz8wEh4ThMhWc5OnPcF2TBA7S6x+Pc\",\"NEWSLETTER_SQS_ACCESS_KEY_ID\":\"AKIAJ2FDL6IZJRD5RNZA\",\"NEWSLETTER_SQS_REGION\":\"sa-east-1\",\"NEWSLETTER_SQS_URL\":\"https://sqs.sa-east-1.amazonaws.com/457003475386/email_handler\",\"COLLECTOR_URL\":\"http://collector.bbrands.com.br\",\"USE_COLLECTOR\":\"1\",\"STORE_GTM_CODE_BY_CART\":\"GTM-KCXJ4P\",\"HEIMDALL_URL\":\"https://heimdall.bbrands.com.br\",\"HEIMDALL_LOGIN\":\"optimus\",\"HEIMDALL_PASS\":\"xzeEGAnN9nPgdnDk\",\"GANDALF_URL\":\"https://gandalf.bbrands.com.br\",\"PAINEL_URL\":\"http://painel.the8co.com.br\",\"JWT_KEY\":\"NKrr69h6ecEvHtEa\",\"ZENDESK_USERNAME_BY_CART\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BY_CART\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BY_CART\":\"https://beyoung.zendesk.com\",\"GANDALF_LOGIN\":\"optimus@bbrands.com.br\",\"GANDALF_PASS\":\"xzeEGAnN9nPgdnDk\",\"EXTERNAL_INTEGRATION_COLOR_ID_URL\":\"https://beyoung.com.br/api/external-integration-open\",\"EXTERNAL_INTEGRATION_COLOR_ID_APP_URL\":\"https://colorid.ai/colorid/2\",\"EXTERNAL_INTEGRATION_COLOR_ID_CALLBACK_URL\":\"https://beyoung.com.br/api/color-id\",\"DOC_URL\":\"http://doc.bbrands.com.br\",\"DB_TYPE\":\"mysql\",\"DB_HOST\":\"internal.marvel.bbrands.com.br\",\"DB_PORT\":\"3306\",\"DB_USERNAME\":\"optimus\",\"DB_PASSWORD\":\"CuY57BevdcQ4f7hh^$kAwSdX@vKmd\",\"DB_DATABASE\":\"optimus\",\"DB_CHARSET\":\"utf8mb4\",\"DB_DEFAULT_ENGINE\":\"InnoDB\",\"DB_LOGGING\":\"false\",\"REDIS_CACHE_HOST\":\"\",\"REDIS_CACHE_PORT\":\"6379\",\"REDIS_CACHE_DB\":\"0\",\"PACKAGE_DEFAULT_WEIGHT\":\"106\",\"STORE_GTM_CODE_BYPSITE\":\"GTM-KCXJ4P\",\"LUCIUS_URL\":\"http://internal.lucius.bbrands.com.br\"}"
ntr
redis-cli -h redis.staging.bbrands.com.br SET OPTIMUS:OPTIMUS_INTERNAL_PRODUCTION "{\"REDIS_CART_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_CART_PORT\":\"6379\",\"REDIS_CART_DB\":\"8\",\"ELASTICSEARCH_LOG_HOST\":\"internal.es.bbrands.com.br\",\"ELASTICSEARCH_LOG_PORT\":\"80\",\"ELASTICSEARCH_LOG_LEVEL\":\"\",\"SLACK_WEBHOOK_URL\":\"https://hooks.slack.com/services/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\",\"MEGAN_URL\":\"http://internal.megan.bbrands.com.br\",\"ELAV_API_URL\":\"http://internal.api.bbrands.com.br\",\"ELAV_USERNAME\":\"mybeautycaps\",\"ELAV_PASSWORD\":\"slimcaps123@\",\"BULK_KEY\":\"NPdfEyChUbF54VLSw3qov8eTxB7GQuaY\",\"JAIMINHO_URL\":\"http://internal.jaiminho.bbrands.com.br\",\"FREIGHT_SOURCES_8S_DEFAULT\":\"8S-02\",\"FREIGHT_SOURCES_VP_DEFAULT\":\"VP-06\",\"FREIGHT_SOURCES_VP_SP\":\"VP-01\",\"FREIGHT_SOURCES_8S_RJ\":\"8S-03\",\"FREIGHT_SOURCES_VP_RJ\":\"VP-03\",\"STARK_URL\":\"http://internal.stark.bbrands.com.br\",\"BUILD_URL\":\"https://storage.googleapis.com/bbrands-optimus-build\",\"AWS_S3_ACCESS_KEY\":\"GOOGICLU52HYDB74MNM7QE6U\",\"AWS_S3_SECRET_KEY\":\"bj6/Ar4sYMc+U1cMqV3LwRZyp+XFBfo3rSfGtyIk\",\"AWS_S3_REGION\":\"us-east4\",\"AWS_S3_BUCKET\":\"bbrands-optimus-build\",\"RECAPTCHA_SITE_KEY\":\"6LcYZGEUAAAAAKLTb067xn-XYxa155HwyHR9STLv\",\"RECAPTCHA_SECRET_KEY\":\"6LcYZGEUAAAAAPNnnw6GQ6sXIr8bcHzy9LaeMDTX\",\"ZENDESK_USERNAME_HCSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_HCSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_HCSITE\":\"https://triptomax.zendesk.com\",\"ZENDESK_USERNAME_SCSITE\":\"felipe.sulimam@slimcaps.com.br\",\"ZENDESK_TOKEN_SCSITE\":\"nRQFBxDuewFfhPcfkbhLmfrlxKWGa0rDN65Z07Kl\",\"ZENDESK_URL_SCSITE\":\"https://slimcaps.zendesk.com\",\"ZENDESK_USERNAME_BYSITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYSITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYSITE\":\"https://beyoung.zendesk.com\",\"ZENDESK_USERNAME_BYISITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYISITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYISITE\":\"https://beyoung.zendesk.com\",\"ZENDESK_USERNAME_TMSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_TMSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_TMSITE\":\"https://triptomax.zendesk.com\",\"ZENDESK_USERNAME_MBSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_MBSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_MBSITE\":\"https://triptomax.zendesk.com\",\"ZENDESK_USERNAME_P4ESITE\":\"atendimento@platinum4ever.com.br\",\"ZENDESK_TOKEN_P4ESITE\":\"pZHSi9HMcub46c8cd2A6PtLrfQBtg8ens39BR5YA\",\"ZENDESK_URL_P4ESITE\":\"https://platinum4ever.zendesk.com\",\"ZENDESK_USERNAME_BCSITE\":\"atendimento@haircaps.com.br\",\"ZENDESK_TOKEN_BCSITE\":\"03tIo1DtrWNmqWrWoo7SV3jWzhHIiGCrtumlic0b\",\"ZENDESK_URL_BCSITE\":\"https://haircaps.zendesk.com\",\"ZENDESK_USERNAME_4EBSITE\":\"\",\"ZENDESK_TOKEN_4EBSITE\":\"\",\"ZENDESK_URL_4EBSITE\":\"\",\"ZENDESK_USERNAME_4EGSITE\":\"\",\"ZENDESK_TOKEN_4EGSITE\":\"\",\"ZENDESK_URL_4EGSITE\":\"\",\"ZENDESK_USERNAME_4EMSITE\":\"\",\"ZENDESK_TOKEN_4EMSITE\":\"\",\"ZENDESK_URL_4EMSITE\":\"\",\"ZENDESK_USERNAME_4EDSITE\":\"\",\"ZENDESK_TOKEN_4EDSITE\":\"\",\"ZENDESK_URL_4EDSITE\":\"\",\"FURY_URL\":\"http://internal.fury.bbrands.com.br\",\"AWS_S3_ENDPOINT\":\"https://storage.googleapis.com\",\"GCP_BIGQUERY_PROJECT_ID\":\"bbrands-production\",\"GCP_BIGQUERY_BUCKET\":\"bbrands-optimus-bigquery\",\"GCP_BIGQUERY_DB\":\"optimus\",\"GCP_BIGQUERY_URL_TABLE\":\"tracking\",\"REDIS_TRACE_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_TRACE_PORT\":\"6379\",\"REDIS_TRACE_DB\":\"6\",\"FREIGHT_SOURCES_8S_RS\":\"8S-04\",\"PAGSEGURO_EMAIL\":\"felipe.sulimam@slimcaps.com.br\",\"PAGSEGURO_TOKEN\":\"ACAB312D0F994154A51D5C3431FE2282\",\"STORE_GTM_CODE_HCSITE\":\"GTM-K3VHHNL\",\"REDIS_CACHE_EMAIL_HOST\":\"redis.cache.bbrands.com.br\",\"REDIS_CACHE_EMAIL_PORT\":\"6379\",\"REDIS_CACHE_EMAIL_DB\":\"10\",\"SLACK_CHANNEL\":\"logger-optimus\",\"FREIGHT_SOURCES_8S_MG\":\"8S-09\",\"FREIGHT_SOURCES_8S_BA\":\"8S-06\",\"FREIGHT_SOURCES_8S_GO\":\"8S-05\",\"FREIGHT_SOURCES_8S_DF\":\"8S-08\",\"GCP_BIGQUERY_URL_NPS_TABLE\":\"nps\",\"REDIS_NPS_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_NPS_PORT\":\"6379\",\"REDIS_NPS_DB\":\"4\",\"JO_URL\":\"http://internal.jo.bbrands.com.br\",\"FREIGHT_SOURCES_8S_SP\":\"8S-02\",\"NEWSLETTER_SQS_SECRET_ACCESS_KEY\":\"hH95llcey+Hz8wEh4ThMhWc5OnPcF2TBA7S6x+Pc\",\"NEWSLETTER_SQS_ACCESS_KEY_ID\":\"AKIAJ2FDL6IZJRD5RNZA\",\"NEWSLETTER_SQS_REGION\":\"sa-east-1\",\"NEWSLETTER_SQS_URL\":\"https://sqs.sa-east-1.amazonaws.com/457003475386/email_handler\",\"COLLECTOR_URL\":\"http://collector.bbrands.com.br\",\"USE_COLLECTOR\":\"1\",\"STORE_GTM_CODE_BY_CART\":\"GTM-KCXJ4P\",\"HEIMDALL_URL\":\"https://heimdall.bbrands.com.br\",\"HEIMDALL_LOGIN\":\"optimus\",\"HEIMDALL_PASS\":\"xzeEGAnN9nPgdnDk\",\"GANDALF_URL\":\"https://gandalf.bbrands.com.br\",\"PAINEL_URL\":\"http://painel.the8co.com.br\",\"JWT_KEY\":\"NKrr69h6ecEvHtEa\",\"ZENDESK_USERNAME_BY_CART\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BY_CART\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BY_CART\":\"https://beyoung.zendesk.com\",\"GANDALF_LOGIN\":\"optimus@bbrands.com.br\",\"GANDALF_PASS\":\"xzeEGAnN9nPgdnDk\",\"EXTERNAL_INTEGRATION_COLOR_ID_URL\":\"https://beyoung.com.br/api/external-integration-open\",\"EXTERNAL_INTEGRATION_COLOR_ID_APP_URL\":\"https://colorid.ai/colorid/2\",\"EXTERNAL_INTEGRATION_COLOR_ID_CALLBACK_URL\":\"https://beyoung.com.br/api/color-id\",\"DOC_URL\":\"http://doc.bbrands.com.br\",\"DB_TYPE\":\"mysql\",\"DB_HOST\":\"internal.marvel.bbrands.com.br\",\"DB_PORT\":\"3306\",\"DB_USERNAME\":\"optimus\",\"DB_PASSWORD\":\"CuY57BevdcQ4f7hh^$kAwSdX@vKmd,\",\"DB_DATABASE\":\"optimus\",\"DB_CHARSET\":\"utf8mb4\",\"DB_DEFAULT_ENGINE\":\"InnoDB\",\"DB_LOGGING\":\"false\",\"REDIS_CACHE_HOST\":\"\",\"REDIS_CACHE_PORT\":\"6379\",\"REDIS_CACHE_DB\":\"0\",\"PACKAGE_DEFAULT_WEIGHT\":\"106\",\"STORE_GTM_CODE_BYPSITE\":\"GTM-KCXJ4P\",\"LUCIUS_URL\":\"http://internal.lucius.bbrands.com.br\"}"
ntr
redis-cli -h redis.staging.bbrands.com.br SET OPTIMUS:OPTIMUS_PRODUCTION "{\"REDIS_CART_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_CART_PORT\":\"6379\",\"REDIS_CART_DB\":\"8\",\"ELASTICSEARCH_LOG_HOST\":\"es.bbrands.com.br\",\"ELASTICSEARCH_LOG_PORT\":\"80\",\"ELASTICSEARCH_LOG_LEVEL\":\"\",\"SLACK_WEBHOOK_URL\":\"https://hooks.slack.com/services/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\",\"MEGAN_URL\":\"http://megan.bbrands.com.br\",\"ELAV_API_URL\":\"http://api.bbrands.com.br\",\"ELAV_USERNAME\":\"mybeautycaps\",\"ELAV_PASSWORD\":\"slimcaps123@\",\"BULK_KEY\":\"NPdfEyChUbF54VLSw3qov8eTxB7GQuaY\",\"JAIMINHO_URL\":\"http://jaiminho.bbrands.com.br\",\"FREIGHT_SOURCES_8S_DEFAULT\":\"8S-02\",\"FREIGHT_SOURCES_VP_DEFAULT\":\"VP-06\",\"FREIGHT_SOURCES_VP_SP\":\"VP-01\",\"FREIGHT_SOURCES_8S_RJ\":\"8S-03\",\"FREIGHT_SOURCES_VP_RJ\":\"VP-03\",\"STARK_URL\":\"http://stark.bbrands.com.br\",\"BUILD_URL\":\"https://storage.googleapis.com/bbrands-optimus-build\",\"AWS_S3_ACCESS_KEY\":\"GOOGICLU52HYDB74MNM7QE6U\",\"AWS_S3_SECRET_KEY\":\"bj6/Ar4sYMc+U1cMqV3LwRZyp+XFBfo3rSfGtyIk\",\"AWS_S3_REGION\":\"us-east4\",\"AWS_S3_BUCKET\":\"bbrands-optimus-build\",\"RECAPTCHA_SITE_KEY\":\"6LcYZGEUAAAAAKLTb067xn-XYxa155HwyHR9STLv\",\"RECAPTCHA_SECRET_KEY\":\"6LcYZGEUAAAAAPNnnw6GQ6sXIr8bcHzy9LaeMDTX\",\"ZENDESK_USERNAME_HCSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_HCSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_HCSITE\":\"https://triptomax.zendesk.com\",\"ZENDESK_USERNAME_SCSITE\":\"felipe.sulimam@slimcaps.com.br\",\"ZENDESK_TOKEN_SCSITE\":\"nRQFBxDuewFfhPcfkbhLmfrlxKWGa0rDN65Z07Kl\",\"ZENDESK_URL_SCSITE\":\"https://slimcaps.zendesk.com\",\"ZENDESK_USERNAME_BYSITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYSITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYSITE\":\"https://beyoung.zendesk.com\",\"ZENDESK_USERNAME_BYISITE\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BYISITE\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BYISITE\":\"https://beyoung.zendesk.com\",\"ZENDESK_USERNAME_TMSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_TMSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_TMSITE\":\"https://triptomax.zendesk.com\",\"ZENDESK_USERNAME_MBSITE\":\"atendimento@triptomax.com.br\",\"ZENDESK_TOKEN_MBSITE\":\"8e75H6MCm9EFLjXbeoNG08xvrBUbDNtbcJ5H8qsA\",\"ZENDESK_URL_MBSITE\":\"https://triptomax.zendesk.com\",\"ZENDESK_USERNAME_P4ESITE\":\"atendimento@platinum4ever.com.br\",\"ZENDESK_TOKEN_P4ESITE\":\"pZHSi9HMcub46c8cd2A6PtLrfQBtg8ens39BR5YA\",\"ZENDESK_URL_P4ESITE\":\"https://platinum4ever.zendesk.com\",\"ZENDESK_USERNAME_BCSITE\":\"atendimento@haircaps.com.br\",\"ZENDESK_TOKEN_BCSITE\":\"03tIo1DtrWNmqWrWoo7SV3jWzhHIiGCrtumlic0b\",\"ZENDESK_URL_BCSITE\":\"https://haircaps.zendesk.com\",\"ZENDESK_USERNAME_4EBSITE\":\"\",\"ZENDESK_TOKEN_4EBSITE\":\"\",\"ZENDESK_URL_4EBSITE\":\"\",\"ZENDESK_USERNAME_4EGSITE\":\"\",\"ZENDESK_TOKEN_4EGSITE\":\"\",\"ZENDESK_URL_4EGSITE\":\"\",\"ZENDESK_USERNAME_4EMSITE\":\"\",\"ZENDESK_TOKEN_4EMSITE\":\"\",\"ZENDESK_URL_4EMSITE\":\"\",\"ZENDESK_USERNAME_4EDSITE\":\"\",\"ZENDESK_TOKEN_4EDSITE\":\"\",\"ZENDESK_URL_4EDSITE\":\"\",\"FURY_URL\":\"http://fury.bbrands.com.br\",\"AWS_S3_ENDPOINT\":\"https://storage.googleapis.com\",\"GCP_BIGQUERY_PROJECT_ID\":\"bbrands-production\",\"GCP_BIGQUERY_BUCKET\":\"bbrands-optimus-bigquery\",\"GCP_BIGQUERY_DB\":\"optimus\",\"GCP_BIGQUERY_URL_TABLE\":\"tracking\",\"REDIS_TRACE_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_TRACE_PORT\":\"6379\",\"REDIS_TRACE_DB\":\"6\",\"FREIGHT_SOURCES_8S_RS\":\"8S-04\",\"PAGSEGURO_EMAIL\":\"felipe.sulimam@slimcaps.com.br\",\"PAGSEGURO_TOKEN\":\"ACAB312D0F994154A51D5C3431FE2282\",\"STORE_GTM_CODE_HCSITE\":\"GTM-K3VHHNL\",\"REDIS_CACHE_EMAIL_HOST\":\"redis.cache.bbrands.com.br\",\"REDIS_CACHE_EMAIL_PORT\":\"6379\",\"REDIS_CACHE_EMAIL_DB\":\"10\",\"SLACK_CHANNEL\":\"logger-optimus\",\"FREIGHT_SOURCES_8S_MG\":\"8S-09\",\"FREIGHT_SOURCES_8S_BA\":\"8S-06\",\"FREIGHT_SOURCES_8S_GO\":\"8S-05\",\"FREIGHT_SOURCES_8S_DF\":\"8S-08\",\"GCP_BIGQUERY_URL_NPS_TABLE\":\"nps\",\"REDIS_NPS_HOST\":\"redis.aws.brain.bbrands.com.br\",\"REDIS_NPS_PORT\":\"6379\",\"REDIS_NPS_DB\":\"4\",\"JO_URL\":\"http://jo.bbrands.com.br\",\"FREIGHT_SOURCES_8S_SP\":\"8S-02\",\"NEWSLETTER_SQS_SECRET_ACCESS_KEY\":\"hH95llcey+Hz8wEh4ThMhWc5OnPcF2TBA7S6x+Pc\",\"NEWSLETTER_SQS_ACCESS_KEY_ID\":\"AKIAJ2FDL6IZJRD5RNZA\",\"NEWSLETTER_SQS_REGION\":\"sa-east-1\",\"NEWSLETTER_SQS_URL\":\"https://sqs.sa-east-1.amazonaws.com/457003475386/email_handler\",\"COLLECTOR_URL\":\"http://collector.bbrands.com.br\",\"USE_COLLECTOR\":\"1\",\"STORE_GTM_CODE_BY_CART\":\"GTM-KCXJ4P\",\"HEIMDALL_URL\":\"https://heimdall.bbrands.com.br\",\"HEIMDALL_LOGIN\":\"optimus\",\"HEIMDALL_PASS\":\"xzeEGAnN9nPgdnDk\",\"GANDALF_URL\":\"https://gandalf.bbrands.com.br\",\"PAINEL_URL\":\"http://painel.the8co.com.br\",\"JWT_KEY\":\"NKrr69h6ecEvHtEa\",\"ZENDESK_USERNAME_BY_CART\":\"atdmby@bbrands.com.br\",\"ZENDESK_TOKEN_BY_CART\":\"CEpwAvKYiXAaU2uzvHIaq8sCmC8KwXO6GClbv1Pn\",\"ZENDESK_URL_BY_CART\":\"https://beyoung.zendesk.com\",\"GANDALF_LOGIN\":\"optimus@bbrands.com.br\",\"GANDALF_PASS\":\"xzeEGAnN9nPgdnDk\",\"EXTERNAL_INTEGRATION_COLOR_ID_URL\":\"https://beyoung.com.br/api/external-integration-open\",\"EXTERNAL_INTEGRATION_COLOR_ID_APP_URL\":\"https://colorid.ai/colorid/2\",\"EXTERNAL_INTEGRATION_COLOR_ID_CALLBACK_URL\":\"https://beyoung.com.br/api/color-id\",\"DOC_URL\":\"http://doc.bbrands.com.br\",\"DB_TYPE\":\"mysql\",\"DB_HOST\":\"marvel.bbrands.com.br\",\"DB_PORT\":\"3306\",\"DB_USERNAME\":\"optimus\",\"DB_PASSWORD\":\"CuY57BevdcQ4f7hh^$kAwSdX@vKmd,\",\"DB_DATABASE\":\"optimus\",\"DB_CHARSET\":\"utf8mb4\",\"DB_DEFAULT_ENGINE\":\"InnoDB\",\"DB_LOGGING\":\"false\",\"REDIS_CACHE_HOST\":\"\",\"REDIS_CACHE_PORT\":\"6379\",\"REDIS_CACHE_DB\":\"0\",\"PACKAGE_DEFAULT_WEIGHT\":\"106\",\"STORE_GTM_CODE_BYPSITE\":\"GTM-KCXJ4P\",\"LUCIUS_URL\":\"http://lucius.bbrands.com.br\"}"
ntr
dcd
ls -l
ls build
ntr
ls -la build
rm -rf build/beyoung.com.br_notestab_final_produtos-booster-kits-b_mobile_organic_ build/beyoung.com.br_notestab_final_produtos-booster-kits-crm_mobile_organic_ build/beyoung.com.br_notestab_final_produtos-glow-kits_mobile_organic_
sudo rm -rf build/beyoung.com.br_notestab_final_produtos-booster-kits-b_mobile_organic_ build/beyoung.com.br_notestab_final_produtos-booster-kits-crm_mobile_organic_ build/beyoung.com.br_notestab_final_produtos-glow-kits_mobile_organic_
ntr
gst
gco master
ntr
gst
ntr
gst
gd
gd src/
ga .
gc
ggp
find-in-files src 'lastTransaction'
find-in-files src 'last_transaction'
gst
ga .
gc -m '(Fix) Usar `coalesce` para acessar `last_transaction`'
ggp
exit
dcu
dcd
bb-open stark
svim stark
cd Beyoung/NPS/08
vim
split-csv ./08-base-nps.csv 3000
split-csv
split-csv -h
split-csv a a
sbash
split-csv a a
split-csv -h
split-csv ./08-base-nps.csv 3000 email
ls -l
cp split/08-base-nps-00.csv ./08-base-interna-nps.csv
vim 08-base-interna-nps.csv 
rm -rf split/
split-csv ./08-base-nps.csv 3000 email
vim
rm split/
rm -rf split/
split-csv ./08-base-nps.csv 3000 email
vi
vim
wc -l 08-base-nps.csv 
ls split/
dotfiles
ls
gst
ebash
vim
ebash
vim scripts/split-csv.js 
ebash
node
yarn
exit
yarn start
tmux attach -t o
tmux ls
tmux attach -t 0
exit
tmux
tmux-start bbrands optimus stark
tmux list
tmux ls
tmux attach -t 0
tmux attach -t bbrands
tmux attach -t 0
tmux attach -t bbrands
npx nodemon get-voice-list.js
npx nodemon ./get-voice-list.js
ls -l
npx nodemon ./src/get-voice-list.js
exit
cd ..
cd samplr-ui/
yarn start
yarn dev
cat package.json 
yarn start
ls -l
yarn
cd ..
cd samplr-js/
yarn start
vim
yarn start
exit
gst
ls -l
rm -rf node_modules/
cp ./* ../samplr-js/
cp -r ./* ../samplr-js/
exit
ga .
rm .git/index.lock 
ga .
gc -m 'update'
gco -b v0.2
ls -l
rm -rf .
rm -rf ./
rm -rf ./**/*
ls -l
rm -rf node_modules/
ls -l
rm -rf ./*
ls -l
yarn
ls -l 
rm -f ./*
rm -rf ./*
gst
ls -la
gst
yarn
vim
gst
vim
gst
gr prettier.config.js
yarn start
exit
svim optimus
bb-open mystique
svim mystique
svim mystique-package
dcu
ntr
bb-open lucius
svim lucius
dcu
ntr
gst
ga src/
gds
gco staging
gc -m '(Feature) Adicionar "PACKAGE" como tipo de Produto'
ggp
ggl
ggp
gl
gco master
ggl
gm origin/staging
ggp
postman
eixt
exit
dcu
bb-open megan
svim megan
vim
yarn start
yarn dev
ls -l
yarn
yarn start
bb-open lucius
svim lucius
dcu
find-in-files 'Parent product (SKU config)'
find-in-files 'Parent product \(SKU config\)'
find-in-files 'findParentByChildOrFail'
find-in-files 'findVariationsByProduct'
find-in-files 'findVariationsIdsByProduct'
gst
gd
gst
gco staging
ga src/
gc -m '(Feat) Não retornar estrutura de produtos quando for Embalagem'
ggp
ntr
gst
gd src/
ga src/
gc -m '(Feature) Adicionar filtro por tipo de produto'
ggp
dcd
dcu
dcd
dcu
ntr
gst
gd
gst
gd src/
gco staging
ga src/
gc -m '(Feature) Não retornar estrutura para produtos do tipo Embalagem'
ggp
ggl
ggp
container stark_Web
container stark_web
gst
gd src/
gr src/
ntr
gst
git stash save
glg
ggl
git stash pop
gst
gd src/
gd
gst
ga src/
gc -m '(Feature) Adicionar as Embalagens da Campanha no `campaign.metadata`'
ggp
ggl
ggp
gst
ga src/
gc -m '(Fix) Não retornar PACKAGE na lista de produtos'
ggp
dcd
bb
cd jaiminho/
vim
cd ../stark
find-in-files 'expirationActions
find-in-files 'expirationActions'
find-in-files 'Parent product (SKU config)'
find-in-files 'Parent product \(SKU config\)'
postman
bb-open stark
svim stark
bb
cd stark
vim
dcu
ntr
gst
gr src/
gst
gd src/
ga src/
gc -m '(Feature) Retornar quantiade em estoque das Embalagens'
ggp
ggl
ggp
node
ggl
gst
gd src/
ga src/
gc -m '(Feature) Atualizar estoque de Embalagens no cache'
ggp
node
exit
dcu
dcd
gco master
gr yarn.lock 
gco master
ggl
gco staging
gm origin/master
gst
ga src/
gc -m '(Fix) Ajuste ao acessar `metadata`'
ggp
gco master
gm origin/staging
ggp
yarn start
yarn start
node
yarn start
ntr
exit
bb
cd stark/
vim .env
vim ../lucius/.env
cd ..
cd megan/
vim .env
exit
bb
cd jaiminho/
gco master
ggl
ls -l
ls -la
vim .env
dcu
k8se
ebash
bb
cd stark/
vim
ggl
dcu
ga .
gc -m '(Fix) Ajuste para não parar o fluxo se não encontrar embalagem'
ggp
container lucius
vim
gst
ga .
gc -m '(Fix) Ajustar tipagem'
ggp
gl
exit
svim optimus
svim options-mothers-month
vim
dcu
zdomain
dcu
dcd
dcu --force-recreate
dcu
dcd
dcu --force-recreate
dcd
dcu --force-recreate
dcu 
gst
ga src/
gc -m '(Fix) Adicionar BY_CART como fallback do store_code nos cookies'
ggp
ggl
ggp
find-in-files 'error_login'
gst
gd src/
ga src/
gc --amend
ggpf
gst
ntr
gst
ga src/routes.ts web/components/Pages/PageContainer/PageContainer.js web/components/Errors/ErrorBoundary.js src/controllers/error.controller.ts web/core/ErrorBoundary.js
find-in-files web 'ErrorBoundary'
gst
gr web/components/Login/Login.js
vim gcp-credentials.json 
gst
gc -m '(Feature) Adicionar ErrorBoundary para notificar de erros no front'
ggp
find-in-files 'error/log'
gst
ntr
gst
ga src/
gst
gds
gst
gc -m '(Fix) Ajuste para não mandar buildar URL repetidas quando usar alias'
ggp
ggl
gst
gd web/
ga web/components/
gc -m '(Fix) Tentar formatar datas do pedido e usar a data sem formatação como fallback'
ggp
gst
gco staging
ggl
gm origin/master
ggp
gco master
gst
nt
ntr
find-in-files web URLSearchParams
find-in-files web useQuery
ls web/helpers/
ntr
find-in-files web URLSearchParams
gst
ga web/
gst
gc
ggp
ntr
find-in-files web 'classnames'
gco staging
ggl
gm origin/master
ggp
gco develop
gst
gm origin/staging
ggp
gco -b feature/mothers-month
ggp
gco develop
gco staging
ggl
gco develop
ggl
gm origin/staging
gco feature/mothers-month
gm origin/develop
gco develop
ggp
gco -
gm origin/develop
ggp
gco -b feature/mothers-month/DEV-3570
gco -b feature/mothers-month-DEV-3570
ntr
kntr
ntr
find-in-files 'expirationActions'
find-in-files 'expiration_actions'
find-in-files 'setCartExpiration'
gco master
gst
gd src/
gst
ga src/
gc -m '(Fix) Calcular brindes depois de atualizar os itens do carrinho'
ggp
ggl
ggp
ggl
ntr
gst
ga src/
gc -m '(Fix) Ajuste para remover os brindes do carrinho se não houver brindes nas campanhas'
ggp
gst
ga src/
gc -m '(Fix) Forçar remover todos os brindes do carrinho'
ggp
gco -
gco feature/mothers-month
ggl
gco -
gm origin/feature/mothers-month
ntr
gst
ga web/
git stash save
gco master
gst
ga src/
gl
gc --amend
ggpf
ntr
gco -
git stash pop
ntr
dcd
ntr
find-in-files web 'import { price }'
find-in-files web 'import\ {\ price\ }'
find-in-files web 'import\ \{\ price\ \}'
find-in-files web 'import React'
find-in-files web 'import\ React'
find-in-files web 'import\\ React'
find-in-files 'import React'
find-in-files 'import { price }'
find-in-files web 'import { price }'
find-in-files 'import { price }' | grep ^web/
dcd
ntr
postman
ntr
gst
gd src/core/
gr src/core/
ntr
cp gcp-credentials-staging.json gcp-credentials.json 
gst
git stash save
gco feature/mothers-month
ggl
gco -
git stash pop
postman
ntr
node
st
gst
gd src/
gr src/
gst
gd web/
gst
ga web/
gst
gc
gst
ga src/ web/
gc --amend
gst
ggp
gco feature/mothers-month
gst
gd web/
gl
ga web/
gc --amend
ntr
gst
git stash
gco feature/mothers-month
ggl
gco -
gm origin/feature/mothers-month
git stash pop
postman
ntr
node
ntr
container optimus
ntr
container optimus
find-in-files 'update-postcode'
find-in-files web 'update-postcode'
find-in-files web 'calculate-postcode'
ntr
tr
ntr
git stash save
gco feature/mothers-month
ggl
gco -
gm origin/feature/mothers-month
git stash pop
gl
ntr
gst
ga package.json web/ yarn.lock 
gl
gst
gc -m '(Fix) Ajustes na seleção de embalagem'
gco feature/mothers-month
gm origin/feature/mothers-month-DEV-3570
ggp
git stash list
gco origin/feature/mothers-month-DEV-3570
gco -
gco feature/mothers-month-DEV-3570
gl
ggp
gl
ggpf
gco feature/mothers-month
gl
gm origin/origin/feature/mothers-month-DEV-3570
gl
gco -
gl
gco -
ggl
gm feature/mothers-month-DEV-3570
git stash save
gco -
git stash save
git merge --abort
gco -
gm >>>>>>> feature/mothers-month-DEV-3570
gm origin/feature/mothers-month
code .
gst
ga web/
gc
ggp
gco feature/mothers-month
gm origin/feature/mothers-month-DEV-3570
ggp
gst
git stash save
gco master
ggl
git stash pop
cp gcp-credentials-production.json gcp-credentials.json 
gst
gm origin/feature/mothers-month
gst
gd src/
gr src/
gst
gd web/
ga web/
gc -m '(Fix) Ajustar interação de embalagem'
ggp
gst
ga src/
gds
gc -m '(Fix) Enviar `data_agendamento_entrega` como null quando for vazia'
ggp
ggl
ggp
gst
gd web/
ga web/
gc -m '(Fix) Mostrar "Ponto de Referência" como obrigatório'
gg
ggl
ggp
gco DEV-3541
gco DEV-3472
gco DEV-3355
git branch
gco nps/DEV-3355
gst
gco -b feature/survey
git stash list
git stash --help
git stash list
git stash drop
git stash list
git stash pop
git stash save
gco develop
gco staging
ggl
gl
gco master
ggl
gco staging
gm origin/master
gst
ga web/
gc
ggp
gco develop
gm origin/staging
ggp
gco feature/survey
gl
gm origin/develop
gst
container optimus
container megan_web
gst
ga .
gc 
ggp
gm origin/master
ggp
vim
clear
bb-vpn
[1]   Done                    /home/iribeiro/Downloads/Postman/Postman/Postman > /dev/null 2>&1
samplr-canvas
bb-vpn
clear
consul
postman
ir
cd samplr-canvas/
code .
htop
tmux
tmux-start bbrands optimus
tmux ls
tmux attach 0
tmux attach -t 0
tmux attach -t bbrands
yarn start
cd ..
cd samplr-ui/
yarn start
cd ..
cd samplr-js/
yarn start
exit
code .
ga .
gc -m '(v0.2) New UI using HTML Canvas and MPC-like ui'
ggp
ga
gst
ga .gitignore 
gst
git remove .cache/
git rm .cache/
git -r rm .cache/
git rm -r .cache
gst
git rm -r .cache
git rm -rf .cache
gst
rm -rf dist/
gst
ga dist
gst
gc -m 'Add dist/ .cache/ to .gitignore'
ggp
gst
ga .
gc -m '(Feat) Add Metronome'
ggp
vim
yarn start
exit
bb
cd optimus/
vim
gst
ga web/ yarn.lock 
gc
im
vim
container optimus
postman
sudo lsusb -vvv |grep -i -B5 -A5 bcdUSB
sudo lsusb -vvv |grep -i -B5 -A5 bDeviceProtocol
exit
yarn add webmidi
yarn start
tmux list
tmux ls
tmux attach -t 0
tmux start bbrands
tmux-start bbrands
ir
tmux
tmux ls
tmux attach -t bbrands
exit
vim
ir
cd samplr-js/
gst
vim
exit
gst
yarn start
ts
yarn start
tmux
bb
cd optimus/
find-in-files src contrast
find-in-files src invert
find-in-files web contrast
find-in-files web/components contrast
find-in-files web/components/**/*.scss contrast
find-in-files *.scss contrast
find-in-files **.scss contrast
find-in-files web contrast | grep .scss
vim
tmux-start bbrands optimus
tmux
tmux-start bbrands optimus
tmux
tmux-start bbrands optimus
google-chrome-stable --help
google-chrome-stable > /dev/null 2>&1
google-chrome-stable &
google-chrome-stable > /dev/null 2>&1 &
tmux list
tmux-start bbrands optimus
tmux
tmux-start bbrands optimus
ebash
sbash
chrome
tmux --help
tmux --h
man tmux
tmux new -d bbrands
tmux list
tmux new
tmux list
tmux ls
tmux kill-session
tmux ls
tmux new -d
tmux ls
tmux kill-session
man tmux new
tmux new -d -s bbrands
tmux ls
tmux-start -f bbrands optimus
chrome
tmux new -d -s bbrands
tmux-start bbrands -f optimus
tmux new -d -s bbrands
tmux ls
tmux-start -f bbrands optimus
tmux-start bbrands optimus -f
tmux
tmux-start bbrands optimus -f
dcu
bb-open collector
svim collector
touch testing.sqlite.cache
ntr
exit
chrome
htop
tmux
tmux-start bbrands optimus
chrome
tmux
tmux-start bbrands optimus
tmux-start bbrands
bb-open megan
svim megan
dcu
bb-open lucius
svim lucius
dcu
ntr
bb-open lucius
svim lucius
chrome
tmux
tmux-start bbrands
chrome
tmux
tmux-start bbrands optimus
sudo dnf check-update
sudo dnf update code
code
exit
chrome
tmux
tmux-start bbrands optimus
bb
cd stark
gst
gd
bb-open stsark
svim stsark
dcu
chrome
tmux
tmux-start bbrands optimus
dcu
ntr
chrome
tmux
tmux-start bbrands
bb-open stark
svim stark
dcu
bb-open optimus
svim optimus
curl 'https://beyoung.com.br/primer/carrinho'   -H 'authority: beyoung.com.br'   -H 'accept: application/json, text/javascript, */*; q=0.01'   -H 'x-newrelic-id: VQEDUlZbCBABU1JUDgADUVQ='   -H 'dnt: 1'   -H 'x-requested-with: XMLHttpRequest'   -H 'user-agent: Mozilla/5.0 (Linux; Android 9; moto g(6) plus) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.83 Mobile Safari/537.36'   -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8'   -H 'origin: https://beyoung.com.br'   -H 'sec-fetch-site: same-origin'   -H 'sec-fetch-mode: cors'   -H 'sec-fetch-dest: empty'   -H 'referer: https://beyoung.com.br/primer/carrinho?p=fb&h=sb20'   -H 'accept-language: en-US,en;q=0.9,pt-BR;q=0.8,pt;q=0.7,und;q=0.6'   -H 'cookie: _scid=6208fb65-5557-450a-b83e-f029189b15af; _ga=GA1.1.1559800760.1568610733; _ga=GA1.3.1559800760.1568610733; _fbp=fb.2.1568610734681.1147281354; sback_client=58506a0982b21c2de75f6d98; sback_partner=false; sb_days=1568610736487; sback_pageview=false; _hjid=c910f054-86e1-4ec5-9d3e-5c50ccdd4b0f; __kdtv=t%3D1534706811378%3Bi%3D8de28bd7fc5b270ed54bcd3cbf1687dcdb755e2a; _kdt=%7B%22t%22%3A1534706811378%2C%22i%22%3A%228de28bd7fc5b270ed54bcd3cbf1687dcdb755e2a%22%7D; _fbc=fb.2.1574997048802.IwAR1gB4CFmCjWnvn40vhsMC9cRa2BFOf6DrVfKoXtvKo42_T3pR3ujK54C1E; __zlcmid=xLj0Jkk1jtyrGg; _gcl_au=1.1.150345766.1586377400; __cfduid=d23c73d34a475327d31286c753bdc41631590803244; pagina_produtos=produtos-fs; PHPSESSID=cd1b53b5e2eee2a4da37767979beff27; desconto_especial=68; _gid=GA1.1.587847452.1590803250; _gid=GA1.3.587847452.1590803250; _st_ses=9396719698699159; _cm_ads_activation_retry=false; _sptid=1702; _spcid=1695; _st_idb=bmV3LmV5SjBlWEFpT2lKS1YxUWlMQ0poYkdjaU9pSklVekkxTmlKOS5leUpsYldGcGJDSTZJblJoYkhsMFlTNXRjMkZ1ZEc5elFHaHZkRzFoYVd3dVkyOXRJbjAudW03SWlhbWsyV1BENG5zZTFaMnBkMmlJbndBTVRmMHdDZlk4REVJT3QtUS5XcldyRHJIZXFCaVlxQktxZ1BEcldy; _st_cart_script=helper_beyoung.js; _st_cart_url=/; sback_browser=0-34630400-1525104131d7ccc487b0771416cf51f1e7767d8b01e82d8dae1453227675ae73e03548d45-78074150-1873513165-1590803251; sback_customer=$2wRxgXRCdVdaR3MY10QUhnWkdXZVVHVw00azMVSGdVbN10aDZUOXJ3TWVzSFlGR40UbyI2Z3RkMPlHbKRGVUdzT2$12; sback_access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2JhY2sudGVjaCIsImlhdCI6MTU5MDgwMzI1MiwiZXhwIjoxNTkwODg5NjUyLCJhcGkiOiJ2MiIsImRhdGEiOnsiY2xpZW50X2lkIjoiNTg1MDZhMDk4MmIyMWMyZGU3NWY2ZDk4IiwiY2xpZW50X2RvbWFpbiI6ImJleW91bmcuY29tLmJyIiwiY3VzdG9tZXJfaWQiOiI1YWU3M2UwNTE3YjFkYTk5MTA2ODhlNzkiLCJjdXN0b21lcl9hbm9ueW1vdXMiOmZhbHNlLCJjb25uZWN0aW9uX2lkIjoiNWI3OWM0ZWVjMTRjZTQxZjFjNGUxZmFmIiwiYWNjZXNzX2xldmVsIjoiY3VzdG9tZXIifX0.w14-MLlWaP3UNqxwKQ2fQEEpQrPuIbP7WrYcwICaG2I.WrWrDrHeqBiYqBKqgPDrgP; sback_current_session=1; sback_total_sessions=119; sback_session=5ed1bb375ce18d2bdb794bd2; sback_customer_w=true; cart_products_total=119.80; cart_total=119.80; cart_purchase=0; cart_purchase_upsell=0; _spl_pv=381; sback_refresh_wp=no; cart_freight=8.62; sback_cart=5ed1bb48ec4b1145c61b2c5f; _gat_UA-85983639-1=1; _st_id=aWdvcnJAYmJyYW5kcy5jb20uYnI=; cpf=000.000.001-91; selected-installments=1x'   --data-raw 'formData=is_cartao%3Don%26id_pedido_03ff1f1c2665cb0eba21c057964a717b310f736e%3D%26nome_03ff1f1c2665cb0eba21c057964a717b310f736e%3DTeste%2BTeste%26telefone_03ff1f1c2665cb0eba21c057964a717b310f736e%3D(11)%2B1111-1111%26cpf_03ff1f1c2665cb0eba21c057964a717b310f736e%3D000.000.001-91%26email_03ff1f1c2665cb0eba21c057964a717b310f736e%3Digorr%2540bbrands.com.br%26cep_03ff1f1c2665cb0eba21c057964a717b310f736e%3D05311-000%26logradouro_03ff1f1c2665cb0eba21c057964a717b310f736e%3DAvenida%2BMofarrej%26nresidencia_03ff1f1c2665cb0eba21c057964a717b310f736e%3D825%26complemento_03ff1f1c2665cb0eba21c057964a717b310f736e%3D%26bairro_03ff1f1c2665cb0eba21c057964a717b310f736e%3DVila%2BLeopoldina%26cidade_03ff1f1c2665cb0eba21c057964a717b310f736e%3DS%25C3%25A3o%2BPaulo%26estado_03ff1f1c2665cb0eba21c057964a717b310f736e%3DSP%26numero_cartao_03ff1f1c2665cb0eba21c057964a717b310f736e%3D5294190000014590%26mes_validade_03ff1f1c2665cb0eba21c057964a717b310f736e%3D05%26ano_validade_03ff1f1c2665cb0eba21c057964a717b310f736e%3D2023%26cod_seguranca_03ff1f1c2665cb0eba21c057964a717b310f736e%3D490%26nome_cartao_03ff1f1c2665cb0eba21c057964a717b310f736e%3DMayra%2BSerrano%2Bde%2BBarros%26cartao_parcelas_03ff1f1c2665cb0eba21c057964a717b310f736e%3D1x%26konduto_id%3Dundefined%26konduto_id%3D8de28bd7fc5b270ed54bcd3cbf1687dcdb755e2a'   --compressed
curl 'https://beyoung.com.br/primer/carrinho'   -H 'authority: beyoung.com.br'   -H 'accept: application/json, text/javascript, */*; q=0.01'   -H 'x-newrelic-id: VQEDUlZbCBABU1JUDgADUVQ='   -H 'dnt: 1'   -H 'x-requested-with: XMLHttpRequest'   -H 'user-agent: Mozilla/5.0 (Linux; Android 9; moto g(6) plus) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.83 Mobile Safari/537.36'   -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8'   -H 'origin: https://beyoung.com.br'   -H 'sec-fetch-site: same-origin'   -H 'sec-fetch-mode: cors'   -H 'sec-fetch-dest: empty'   -H 'referer: https://beyoung.com.br/primer/carrinho?p=fb&h=sb20'   -H 'accept-language: en-US,en;q=0.9,pt-BR;q=0.8,pt;q=0.7,und;q=0.6'   -H 'cookie: _scid=6208fb65-5557-450a-b83e-f029189b15af; _ga=GA1.1.1559800760.1568610733; _ga=GA1.3.1559800760.1568610733; _fbp=fb.2.1568610734681.1147281354; sback_client=58506a0982b21c2de75f6d98; sback_partner=false; sb_days=1568610736487; sback_pageview=false; _hjid=c910f054-86e1-4ec5-9d3e-5c50ccdd4b0f; __kdtv=t%3D1534706811378%3Bi%3D8de28bd7fc5b270ed54bcd3cbf1687dcdb755e2a; _kdt=%7B%22t%22%3A1534706811378%2C%22i%22%3A%228de28bd7fc5b270ed54bcd3cbf1687dcdb755e2a%22%7D; _fbc=fb.2.1574997048802.IwAR1gB4CFmCjWnvn40vhsMC9cRa2BFOf6DrVfKoXtvKo42_T3pR3ujK54C1E; __zlcmid=xLj0Jkk1jtyrGg; _gcl_au=1.1.150345766.1586377400; __cfduid=d23c73d34a475327d31286c753bdc41631590803244; pagina_produtos=produtos-fs; PHPSESSID=cd1b53b5e2eee2a4da37767979beff27; desconto_especial=68; _gid=GA1.1.587847452.1590803250; _gid=GA1.3.587847452.1590803250; _st_ses=9396719698699159; _cm_ads_activation_retry=false; _sptid=1702; _spcid=1695; _st_idb=bmV3LmV5SjBlWEFpT2lKS1YxUWlMQ0poYkdjaU9pSklVekkxTmlKOS5leUpsYldGcGJDSTZJblJoYkhsMFlTNXRjMkZ1ZEc5elFHaHZkRzFoYVd3dVkyOXRJbjAudW03SWlhbWsyV1BENG5zZTFaMnBkMmlJbndBTVRmMHdDZlk4REVJT3QtUS5XcldyRHJIZXFCaVlxQktxZ1BEcldy; _st_cart_script=helper_beyoung.js; _st_cart_url=/; sback_browser=0-34630400-1525104131d7ccc487b0771416cf51f1e7767d8b01e82d8dae1453227675ae73e03548d45-78074150-1873513165-1590803251; sback_customer=$2wRxgXRCdVdaR3MY10QUhnWkdXZVVHVw00azMVSGdVbN10aDZUOXJ3TWVzSFlGR40UbyI2Z3RkMPlHbKRGVUdzT2$12; sback_access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuc2JhY2sudGVjaCIsImlhdCI6MTU5MDgwMzI1MiwiZXhwIjoxNTkwODg5NjUyLCJhcGkiOiJ2MiIsImRhdGEiOnsiY2xpZW50X2lkIjoiNTg1MDZhMDk4MmIyMWMyZGU3NWY2ZDk4IiwiY2xpZW50X2RvbWFpbiI6ImJleW91bmcuY29tLmJyIiwiY3VzdG9tZXJfaWQiOiI1YWU3M2UwNTE3YjFkYTk5MTA2ODhlNzkiLCJjdXN0b21lcl9hbm9ueW1vdXMiOmZhbHNlLCJjb25uZWN0aW9uX2lkIjoiNWI3OWM0ZWVjMTRjZTQxZjFjNGUxZmFmIiwiYWNjZXNzX2xldmVsIjoiY3VzdG9tZXIifX0.w14-MLlWaP3UNqxwKQ2fQEEpQrPuIbP7WrYcwICaG2I.WrWrDrHeqBiYqBKqgPDrgP; sback_current_session=1; sback_total_sessions=119; sback_session=5ed1bb375ce18d2bdb794bd2; sback_customer_w=true; cart_products_total=119.80; cart_total=119.80; cart_purchase=0; cart_purchase_upsell=0; _spl_pv=381; sback_refresh_wp=no; cart_freight=8.62; sback_cart=5ed1bb48ec4b1145c61b2c5f; _gat_UA-85983639-1=1; _st_id=aWdvcnJAYmJyYW5kcy5jb20uYnI=; cpf=000.000.001-91; selected-installments=1x'   --data-raw 'formData=is_cartao%3Don%26id_pedido_03ff1f1c2665cb0eba21c057964a717b310f736e%3D%26nome_03ff1f1c2665cb0eba21c057964a717b310f736e%3DTeste%2BTeste%26telefone_03ff1f1c2665cb0eba21c057964a717b310f736e%3D(11)%2B1111-1111%26cpf_03ff1f1c2665cb0eba21c057964a717b310f736e%3D000.000.001-91%26email_03ff1f1c2665cb0eba21c057964a717b310f736e%3Digorr%2540bbrands.com.br%26cep_03ff1f1c2665cb0eba21c057964a717b310f736e%3D05311-000%26logradouro_03ff1f1c2665cb0eba21c057964a717b310f736e%3DAvenida%2BMofarrej%26nresidencia_03ff1f1c2665cb0eba21c057964a717b310f736e%3D825%26complemento_03ff1f1c2665cb0eba21c057964a717b310f736e%3D%26bairro_03ff1f1c2665cb0eba21c057964a717b310f736e%3DVila%2BLeopoldina%26cidade_03ff1f1c2665cb0eba21c057964a717b310f736e%3DS%25C3%25A3o%2BPaulo%26estado_03ff1f1c2665cb0eba21c057964a717b310f736e%3DSP%26numero_cartao_03ff1f1c2665cb0eba21c057964a717b310f736e%3D5294190000014590%26mes_validade_03ff1f1c2665cb0eba21c057964a717b310f736e%3D05%26ano_validade_03ff1f1c2665cb0eba21c057964a717b310f736e%3D2023%26cod_seguranca_03ff1f1c2665cb0eba21c057964a717b310f736e%3D490%26nome_cartao_03ff1f1c2665cb0eba21c057964a717b310f736e%3DMayra%2BSerrano%2Bde%2BBarros%26cartao_parcelas_03ff1f1c2665cb0eba21c057964a717b310f736e%3D1x%26konduto_id%3Dundefined%26konduto_id%3D8de28bd7fc5b270ed54bcd3cbf1687dcdb755e2a'   --compressed
exit
chrome
tmux-start bbrands
tmux
tmux-start bbrands
ntr
exit
bb-open stark
svim stark
dcu
find-in-files src 'totalProducts = '
find-in-files src 'totalProducts ='
find-in-files src 'totalProducts='
find-in-files src 'totalProduct'
find-in-files src 'totalProducts'
gco staging
gst
ga 
ga .
gds
gc
ggp
gco master
gm origin/staging
ggp
bb-open lucius
svim lucius
bb
cd stark
gst
gst
ggl
gco master
gm  origin/staging
ggp
chrome
tmux
tmux-start bbrands
