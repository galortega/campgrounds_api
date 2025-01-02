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

2. Install the dependencies:

   ```sh
   bundle install
   ```

3. Create the database:

   **Stop the local database server if it is running.**

   ```sh
    docker-compose up -d
    rails db:create
   ```

4. Run the migrations:

   ```sh
   rails db:migrate
   ```

5. Load the fixtures:

   ```sh
    rails db:fixtures:load
   ```

6. Start the server:

   ```sh
   rails s
   ```

7. Open your browser and navigate to `http://localhost:3000` to view the application.

8. Browse the API documentation at `https://www.postman.com/blubear-dev-apis/campgrounds-api/documentation/zznbij1/v1?workspaceId=d779d5c2-517c-4bb4-9a6c-60cba2206e08`.
