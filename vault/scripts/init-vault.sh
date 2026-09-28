#!/bin/sh
set -e

echo "=== Vault Initialization ==="

# Wait for Vault
until vault status > /dev/null 2>&1; do
  echo "Waiting for Vault..."
  sleep 1
done

# Enable KV v2
vault secrets enable -path=secret kv-v2 2>/dev/null || true

# Store application secrets
vault kv put secret/nodegoat \
  mongodb_uri="mongodb://mongo:27017/nodegoat" \
  session_secret="$(openssl rand -base64 32)" \
  app_secret="$(openssl rand -base64 32)"

# Create policy
vault policy write nodegoat-policy /vault/scripts/nodegoat-policy.hcl

# Enable AppRole auth
vault auth enable approle 2>/dev/null || true

vault write auth/approle/role/nodegoat \
  token_policies="nodegoat-policy" \
  token_ttl=1h \
  token_max_ttl=4h

# Output Role ID and Secret ID for the application
ROLE_ID=$(vault read -field=role_id auth/approle/role/nodegoat/role-id)
SECRET_ID=$(vault write -f -field=secret_id auth/approle/role/nodegoat/secret-id)

echo "VAULT_ROLE_ID=$ROLE_ID" > /vault/scripts/vault-credentials.env
echo "VAULT_SECRET_ID=$SECRET_ID" >> /vault/scripts/vault-credentials.env

echo "=== Vault Initialization Complete ==="
