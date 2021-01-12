# AUCTIONS

## Dev Setup

1. Copy envirionement file.

```
cp .env_example .env
```

2. Modify contents of `.env` to your requirements

3. Spin up docker containers:

```
docker-compose up -d
```

4. Create and Seed DB then run migrations:

```
docker-compose exec app bundle exec rake db:setup db:migrate
```
