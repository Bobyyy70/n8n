# 1. On part de l'image n8n officielle
# Vous pouvez remplacer "latest" par une version spécifique si vous le souhaitez, ex: n8nio/n8n:1.20.0
FROM n8nio/n8n:latest

# 2. On passe en utilisateur "root" temporairement pour installer des choses
USER root

# 3. On met à jour la liste des logiciels et on installe "chromium"
#    (et quelques polices utiles pour une meilleure compatibilité des pages web)
RUN apt-get update && \
    apt-get install -y \
    chromium \
    fonts-ipafont-gothic \
    fonts-wqy-zenhei \
    --no-install-recommends \
    && \
    # 4. On nettoie pour que l'image ne soit pas trop grosse
    rm -rf /var/lib/apt/lists/*

# 5. On repasse à l'utilisateur normal de n8n pour la sécurité
USER node
