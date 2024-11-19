# Sarkari Result Clone

A **Sarkari Result Clone** web application that provides updates on government job notifications, admit cards, and exam results. Built with a **Svelte** frontend and a **Hono.js** backend, this project is containerized using **Docker** and deployable on **Kubernetes**.

---

## Features

- **Job Listings**: Display the latest government job openings with details and application links.
- **Admit Card Updates**: Provides quick access to admit card downloads.
- **Exam Results**: Lists exam results for various government exams.
- **Modern UI**: Responsive and user-friendly interface built using Svelte.
- **API-Driven Backend**: Lightweight and fast API responses powered by Hono.js.
- **Dockerized**: Easily containerized for consistent deployments.
- **Kubernetes-Ready**: Configured for scalable deployment on Kubernetes.

---

## Tech Stack

- **Frontend**: Svelte
- **Backend**: Hono.js
- **Containerization**: Docker
- **Orchestration**: Kubernetes
- **Infrastructure as Code**: Terraform (for AWS resource provisioning)

---

## Setup Instructions

### Prerequisites
- [Node.js](https://nodejs.org/)
- [Docker](https://www.docker.com/)
- [Minikube](https://minikube.sigs.k8s.io/docs/) (for Kubernetes)
- [Terraform](https://www.terraform.io/) (optional, for AWS provisioning)

---

### Running Locally

1. **Clone the Repository**:
   ```bash
   git clone git@github-bbl-sh:bbl-sh/sarkari-result-clone.git
   cd sarkari-result-clone

2. **Install Dependencies**:
   - Frontend:
     ```bash
     cd frontend
     npm install
     ```
   - Backend:
     ```bash
     cd ../backend
     npm install
     ```

3. **Start the Application**:
   - Frontend:
     ```bash
     npm run dev --prefix frontend
     ```
   - Backend:
     ```bash
     npm run dev --prefix backend
     ```

4. **Access the Application**:
   - Frontend: Open `http://localhost:5173` in your browser.
   - Backend API: Accessible at `http://localhost:3000/api`.

---

### Docker Deployment

1. **Build and Run the Docker Container**:
   ```bash
   docker build -t sarkari-result-clone .
   docker run -p 5173:5173 -p 3000:3000 sarkari-result-clone
   ```

2. **Access the Application**:
   - Frontend: `http://localhost:5173`
   - Backend API: `http://localhost:3000`

---

### Kubernetes Deployment

1. **Start Minikube**:
   ```bash
   minikube start
   ```

2. **Build Docker Image in Minikube**:
   ```bash
   eval $(minikube docker-env)
   docker build -t sarkari-result-clone .
   ```

3. **Apply Kubernetes Manifests**:
   ```bash
   kubectl apply -f k8s/fullstack-deployment.yaml
   kubectl apply -f k8s/fullstack-service.yaml
   ```

4. **Access the Application**:
   Get the service URL:
   ```bash
   minikube service fullstack-service
   ```

---

### Terraform for AWS (Optional)

Use the included Terraform configuration in the `terraform/` directory to provision AWS resources for deployment. Refer to the Terraform documentation for instructions.

---

## Folder Structure

```
sr-v0/
├── frontend/          # Svelte frontend
├── backend/           # Hono.js backend
├── k8s/               # Kubernetes manifests
├── terraform/         # Terraform configuration for AWS
├── Dockerfile         # Docker configuration
├── deploy-k8s.sh      # Kubernetes deployment script
├── deploy-terraform.sh# Terraform deployment script
├── sample.env         # Example environment variables file
└── README.md          # Project documentation
```

---

## Environment Variables

Create a `.env` file based on the provided `sample.env`:
```env
AWS_ACCESS_KEY_ID=your-access-key-id
AWS_SECRET_ACCESS_KEY=your-secret-access-key
```

---

## Contributing

Contributions are welcome! Please fork the repository and create a pull request for any changes.
