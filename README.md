# Campgrounds API

This README documents the steps necessary to get the Campgrounds API application up and running.

## Prerequisites

- **Ruby version**: 3.3.6
- **Rails version**: 8.0.0
- **Docker**: Ensure Docker and Docker Compose are installed on your system.

## System dependencies

- Docker
- Docker Compose

## Configuration

1. Clone the repository:

   ```sh
   git clone https://github.com/yourusername/campgrounds_api.git
   cd campgrounds_api
   ```

2. Create the database:

   ```sh
    docker-compose up
    rails db:create
   ```

3. Run the migrations:

   ```sh
   rails db:migrate
   ```

4. Load the fixtures:

   ```sh
    rails db:fixtures:load
   ```

5. Start the server:

   ```sh
   rails s
   ```

6. Open your browser and navigate to `http://localhost:3000` to view the application.
