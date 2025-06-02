# database
- 2025 Spring informatyka(studia inżynierskie 2 rok)
- Database systems project

This project allows you to quickly spin up a MySQL database in a Docker container with automatic SQL file initialization.

## Getting Started
Clone the repository:
```
git clone https://github.com/Violeeeeeeee/database.git
cd database
```

### Run the container
```
docker-compose up -d
```

MySQL will be available at localhost:3307.
### Default credentials:
- Host: localhost
- Port: 3307
- User: root
- Password: pass

### Common commands
Start (without removing data):
```
docker-compose up -d
```

Stop (without removing data):
```
docker-compose down
```

Remove everything (including data):
```
docker-compose down -v
```

Check container status:
```
docker ps
```
