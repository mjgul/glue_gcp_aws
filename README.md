# My Cloud Resume

This project demonstrates a hybrid cloud architecture using AWS and GCP to host a serverless resume website with a visitor counter.

## Architecture

- **Frontend**: Static HTML/CSS/JS hosted on Google Cloud Storage (GCS).
- **Backend**: Google Cloud Function (Python) acting as an API.
- **Database**: AWS DynamoDB storing the visitor count.
- **Infrastructure as Code**: Terraform managing resources on both AWS and GCP.
- **CI/CD**: GitHub Actions for automated deployment.

## Folder Structure

- `.github/workflows`: CI/CD pipelines.
- `app/api`: Python Cloud Function code.
- `app/client`: Static website code.
- `infra`: Terraform configuration.
- `tests`: Unit tests.

## Setup

1. **Prerequisites**:
   - AWS Account & CLI configured.
   - GCP Project & CLI configured.
   - Terraform installed.

2. **Deploy Infrastructure**:
   ```bash
   cd infra
   terraform init
   terraform apply
   ```

3. **Deploy Website**:
   - The `deploy-site.yml` workflow handles this on push to main.
   - Or manually: `gsutil -m rsync -r app/client gs://YOUR_BUCKET_NAME`

## Blog Post

[Link to your blog post describing the project]
