# database
baza danych

Ten projekt umożliwia szybkie uruchomienie bazy danych MySQL w kontenerze Docker z inicjalizacją przez pliki SQL.
## Wymagane narzędzia
    Git dla Windows
    Docker Desktop (zawiera Docker Compose)

## Instalacja
1. Zainstaluj Git
    Pobierz Git z oficjalnej strony
    Zainstaluj (https://git-scm.com/)
2. Zainstaluj Docker Desktop
    Pobierz Docker Desktop z docker.com
    Podczas instalacji zgódź się na instalację WSL 2 (jeśli to konieczne)
    Po zakończeniu instalacji — zrestartuj komputer
    Uruchom Docker i upewnij się, że działa (zielona ikona w tray'u)
## Struktura repozytorium
your-repo/
├── docker-compose.yml
└── db/
├── init/
│ ├── 01_schema.sql
└── my.cnf (opcjonalnie)

    Wszystkie pliki .sql z db/init/ są automatycznie wykonywane przy pierwszym uruchomieniu.

## Uruchomienie

### Sklonuj repozytorium
git clone https://github.com/Violeeeeeeee/database.githttps://github.com/
cd database

Uruchom kontener:
docker-compose up -d

MySQL będzie dostępny na localhost:3307

Hasło root: pass

Parametry połączenia z bazą danych:
* Host: localhost
* Port: 3307
* Użytkownik: root
* Hasło: pass

### Komendy zarządzania
Uruchomienie (bez usuwania danych)

```bash
docker-compose up -d
```
Zatrzymanie (bez usuwania)

```bash
docker-compose down
```

Całkowite usunięcie z danymi

```bash
docker-compose down -v
```

Sprawdzenie statusu

```bash
docker ps
```

