#!/bin/bash
set -e  # Arrête le script en cas d'erreur

# Vérifier que la version est fournie
if [ -z "$1" ]; then
    echo "Usage: $0 <version> (ex: 3.8.3)"
    exit 1
fi

VERSION="$1"
TEMPLATE_DIR="qualcoder-template"
NEW_DIR="qualcoder-${VERSION}"
UPSTREAM_URL="https://github.com/ccbogel/QualCoder/releases/download/${VERSION}/QualCoder_${VERSION}_ubuntu"

# 1. Copier le template
echo "📁 Copie du template vers ${NEW_DIR}..."
cp -r "$TEMPLATE_DIR" "$NEW_DIR"

# 2. Télécharger le binaire
echo "Download QualCoder ${VERSION}..."
wget -O "${NEW_DIR}/src/qualcoder" "$UPSTREAM_URL"
chmod +x "${NEW_DIR}/src/qualcoder"  # Rendre exécutable

# 3. Mettre à jour le changelog
echo "📝 Update changelog ..."
cat > "${NEW_DIR}/debian/changelog" << EOF
qualcoder (${VERSION}-1) UNRELEASED; urgency=medium

  * New upstream release ${VERSION}.
  * See https://github.com/ccbogel/QualCoder/releases/tag/${VERSION}

 -- QualCoder Team <contact@qualcoder.org>  $(date -R)
EOF

# 4. Construire le package
echo "Build version ${VERSION}..."
cd "$NEW_DIR"
debuild -us -uc
cd ..

echo "Package released : ../qualcoder_${VERSION}-1_amd64.deb"
