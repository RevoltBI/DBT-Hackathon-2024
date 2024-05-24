rm -r models/_sources
kbc dbt generate sources -t dev -H $KBC_API_HOST -t $KBC_STORAGE_API_TOKEN --non-interactive