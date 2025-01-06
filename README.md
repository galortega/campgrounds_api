# **Campgrounds API**

This API allows users to explore campgrounds and manage their favorites. It is built with Ruby on Rails and follows RESTful API principles to provide a robust and scalable backend.

---

## **Table of Contents**

- [Architecture Overview](#architecture-overview)
- [Prerequisites](#prerequisites)
- [System Dependencies](#system-dependencies)
- [Configuration and Setup](#configuration-and-setup)
- [API Documentation](#api-documentation)
- [Testing the Application](#testing-the-application)
- [Key Technical Decisions](#key-technical-decisions)

---

## **Architecture Overview**

### **Core Features**

- Users can **favorite campgrounds** and manage their favorite lists.
- Implements **authentication** using session tokens.
- Includes **caching** for frequently accessed data to improve performance.
- Built with **ActiveRecord** to manage database relationships:
  - Users can have multiple favorites and sessions.
  - Campgrounds can be favorited by multiple users.

### **Directory Structure**

- **`app/models`**: Contains models such as `User`, `Campground`, `Favorite`, and `Session`.
- **`app/controllers`**: Includes controllers like `V1::CampgroundsController` and `V1::FavoritesController` for API endpoints.
- **`app/views`**: Renders JSON responses using Jbuilder templates.
- **`spec/`**: Contains unit and integration tests using RSpec.

---

## **Prerequisites**

- **Ruby version**: 3.3.6
- **Rails version**: 8.0.0
- **Docker**: Ensure Docker and Docker Compose are installed.

---

## **System Dependencies**

- **Docker and Docker Compose**: To manage the containerized services (database).

---

## **Configuration and Setup**

1. **Clone the Repository**

   ```bash
   git clone https://github.com/galortega/campgrounds_api.git
   cd campgrounds_api
   ```

2. **Install Dependencies**

   ```bash
   bundle install
   ```

3. **Database Setup**
   Start the database and create the necessary schema:

   ```bash
   docker-compose up -d
   rails db:create
   rails db:migrate
   ```

4. **Load Seed Data**
   Preload sample data for testing and development:

   ```bash
   rails db:fixtures:load
   ```

5. **Start the Application**
   Run the Rails server:

   ```bash
   rails s
   ```

   Access the API at `http://localhost:3000`.

6. **API Documentation**
   Explore the API documentation in Postman:
   [Campgrounds API Postman Documentation](https://www.postman.com/blubear-dev-apis/campgrounds-api/documentation/zznbij1/v1?workspaceId=d779d5c2-517c-4bb4-9a6c-60cba2206e08)

---

## **Testing the Application**

Run the RSpec test suite:

```bash
rspec
```

Test coverage includes:

- Unit tests for models (`spec/models`).
- Integration tests for controllers (`spec/controllers`).

---

## **Key Technical Decisions**

1. **Authentication**

   - Sessions are used for stateless authentication via secure tokens.
   - `Current` object manages user session information across requests.

2. **Caching**

   - Frequently accessed endpoints (e.g., campgrounds index) use Rails caching to reduce database load.

3. **Database Design**

   - `Users`, `Campgrounds`, and `Favorites` are linked through associations.
   - Unique constraints and validations prevent duplicate favorites.

4. **Error Handling**

   - Detailed error messages are returned for invalid requests.
   - Custom errors include `401 Unauthorized` for authentication failures and `422 Unprocessable Entity` for validation errors.

5. **Scalability**

   - Indexes on key database fields improve query performance (e.g., `email_address` and foreign keys).
   - Designed to handle large datasets with efficient queries.

6. **API Design**

   - Follows RESTful conventions.
   - Uses Jbuilder for flexible and efficient JSON rendering.

7. **Testing Strategy**
   - Comprehensive RSpec test coverage ensures reliability and helps catch regressions.
   - Fixtures are used for preloaded test data.
