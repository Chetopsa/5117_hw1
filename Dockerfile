# Use an official Python base image
FROM python:3.10

# Set working directory
WORKDIR /app

# Install pipenv
RUN pip install pipenv

# Copy Pipenv files first for caching
COPY Pipfile Pipfile.lock ./

# Install dependencies system-wide (no virtualenv inside container)
RUN pipenv install --system --deploy --ignore-pipfile
# Copy the rest of the app
COPY . .

# Expose port 8000 (Render defaults to $PORT env var)
EXPOSE 8000

# Start the app with gunicorn
CMD ["pipenv", "run", "gunicorn", "-b", "0.0.0.0:8000", "app:app"]
