# Step 1: Use Node.js as the base image
FROM node:18

# Step 2: Set up working directory
WORKDIR /app

# Step 3: Copy both frontend and backend directories into the container
COPY frontend ./frontend
COPY backend ./backend

# Step 4: Install dependencies for both frontend and backend
WORKDIR /app/frontend
RUN npm install

WORKDIR /app/backend
RUN npm install

# Step 5: Expose the ports used by frontend and backend
EXPOSE 5173
EXPOSE 3000

# Step 6: Run both development servers
CMD npm run --prefix frontend dev & npm run --prefix backend dev
