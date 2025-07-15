
# Anypoint Platform Client Applications - Bruno Collection

Bruno API collection for Anypoint Platform client application lifecycle management. Provides complete CRUD operations and credential management workflows.

## Prerequisites

```bash
npm install -g @usebruno/cli
```

## Configuration

Copy and configure environment variables in `bruno-collection/environments/dev.bru`:

```
connected_app_client_id: your_client_id
connected_app_client_secret: your_client_secret
organization_id: your_org_id
environment_id: your_env_id
url: https://anypoint.mulesoft.com
```

## Usage

### Run Complete Workflow
```bash
./bruno-collection/demo-bruno-cli.sh
```

### Run Individual Operations
```bash
# Authentication
bru run "01 - authentication" --env dev

# Client application CRUD
bru run "02 - client-applications" --env dev

# Credential management
bru run "03 - credentials" --env dev

# API contracts and SLA tiers
bru run "04 - api-access" --env dev
```

### Run Single Request
```bash
bru run "01 - authentication/01-generate-access-token.bru" --env dev
```

## Request Flow

1. **Authentication** - OAuth2 token generation and validation
2. **Client Applications** - Create, list, get, update operations
3. **Credentials** - Client secret regeneration
4. **API Access** - Contract management and SLA tier operations

Environment variables are automatically extracted and propagated between requests to maintain state consistency.
