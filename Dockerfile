FROM node:18

WORKDIR /usr/src/app

# Nëse nuk ke package.json, hiqe rreshtat e mëposhtëm
# COPY package*.json ./
# RUN npm install

COPY . .

CMD ["node", "app.js"]

