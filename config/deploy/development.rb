set :deploy_to, "/web/image-seller/development"
set :branch, "development"

server "image-seller.minow.io", user: "magento", port: "22", roles: %w{web app}, primary: true