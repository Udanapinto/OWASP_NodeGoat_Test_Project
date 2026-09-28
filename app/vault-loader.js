const axios = require('axios');

async function loadSecrets() {
  const vaultAddr = process.env.VAULT_ADDR || 'http://vault-dev:8200';
  const vaultToken = process.env.VAULT_TOKEN;

  if (!vaultToken) {
    console.warn('Vault token not configured, using environment variables');
    return {};
  }

  try {
    // Retrieve secrets directly using the root token
    const secretResponse = await axios.get(`${vaultAddr}/v1/secret/data/nodegoat`, {
      headers: { 'X-Vault-Token': vaultToken },
    });

    const secrets = secretResponse.data.data.data;

    // Inject into process.env
    if (secrets.mongodb_uri) process.env.MONGODB_URI = secrets.mongodb_uri;
    if (secrets.session_secret) process.env.SESSION_SECRET = secrets.session_secret;
    if (secrets.app_secret) process.env.APP_SECRET = secrets.app_secret;

    console.log('Secrets loaded from Vault successfully');
    return secrets;
  } catch (error) {
    console.error('Failed to load secrets from Vault:', error.message);
    return {};
  }
}

module.exports = { loadSecrets };
