# `postgres-rls-sample`

## Understand project

We have 2 tables with RLS enabled:
- `operating_company` with columns `id` and `name`
- `operating_user` with columns `id`, `operating_company_id` and `name`

We will create 2 Operating Companies and 4 Operating Users.

We create a postgres user with username "2" that will be able to see only the Operating Company with `id = 2` and the Operating Users with `operating_company_id = 2`.


## Setup
```bash
# Install dependencies
pnpm install
# Start the database
pnpm dcc up -d
```

## Run

We will connect to the database with username "2", and use `findMany()` method to get the Operating Companies and Operating Users.

```bash
pnpm start
```

The terminal will print the following content:

```javascript
{
  operatingCompanies: [ { id: 2, name: 'Company 2' } ],
  operatingUsers: [
    { id: 2, operatingCompanyId: 2, name: 'User 2' },
    { id: 4, operatingCompanyId: 2, name: 'User 4' }
  ]
}
```
