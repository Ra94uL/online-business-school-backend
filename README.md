# Online Business School Backend

A Spring Boot backend for an online business school. The project uses Java, Maven, and MySQL.

## Development workflow

- Use one branch and one pull request per focused change.
- Open pull requests against `main`.
- Fill in the pull request template. Explain what changed, why it changed, and how you tested it.
- Tick only the boxes that apply and that you have verified. If you didn't run any tests, say why.


## Flyway migrations

- Flyway is configured to manage database changes.
- Do not modify V1__init.sql after it has been applied to a database.
- Add the next change as a new file in src/main/resources/db/migration/,
  for example V2__add_description.sql.
- Build and restart the application. Flyway will apply the new migration
  to the configured database and record it in the history table.
- Use a new version number for each later change, such as V3, V4, and so on.


## Docker

Docker Compose runs two containers: the Spring Boot app and a MySQL database.
You need Docker Desktop installed and running before you start.

### Set up your environment

Create a file named `.env` in the project folder, next to `docker-compose.yml`.
Add these values and replace the example passwords with your own:

```dotenv
MYSQL_ROOT_PASSWORD=replace_with_a_root_password
DOCKER_DB_USER=school_user
DOCKER_DB_PASSWORD=replace_with_a_database_password
```

Docker Compose reads this file and passes the settings to the containers.
The `.env` file is ignored by Git. Keep your passwords out of commits.

### Start the app and database

Run this command from the project folder:

```powershell
docker compose up --build -d
```

The app waits for MySQL to be ready before it starts. On a new, empty database,
Flyway runs `V1__init.sql` to create the tables. Later starts apply any new migrations.
The migration creates tables but does not add sample data.

The app listens at `http://localhost:8080`. To connect with a database tool, use:

- Host: `localhost`
- Port: `3307`
- Database: `online_business_school_flyway`
- Username and password: the `DOCKER_DB_USER` and `DOCKER_DB_PASSWORD` values in `.env`

Inside the Docker network, the app connects to `school-database:3306`.

### Check logs and stop the containers

Check the container status and app logs:

```powershell
docker compose ps -a
docker compose logs --tail=100 online-school-backend
```

Stop and remove the containers:

```powershell
docker compose down
```

The database is stored in a named volume, so its data stays when you remove the
containers. Running `docker compose up --build -d` starts them again with the same data.
Do not add `-v` to `docker compose down` unless you want to delete the database volume
and all its data.

Changing passwords in `.env` does not update users in an existing database volume.
Use the existing passwords or update the users in MySQL first.
