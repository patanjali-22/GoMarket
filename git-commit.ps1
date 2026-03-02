Remove-Item -Recurse -Force .git -ErrorAction SilentlyContinue

git init
git config user.name "patanjali-22"
git config user.email "patanjali-22@users.noreply.github.com"
git remote add origin https://github.com/patanjali-22/GoMarket.git
git branch -M main

function Add-Commit {
    param (
        [string]$Path,
        [string]$Message
    )
    if (Test-Path $Path) {
        git add $Path
        git commit -m $Message
    }
}

Add-Commit -Path "go.mod" -Message "Init go module"
Add-Commit -Path "go.sum" -Message "Add dependency checksums"
Add-Commit -Path ".gitignore" -Message "Add gitignore rules"
Add-Commit -Path "README.md" -Message "Add README documentation"
Add-Commit -Path "assets" -Message "Add project assets"

Add-Commit -Path "account/account.proto" -Message "Define account gRPC service interface"
Add-Commit -Path "account/pb" -Message "Generate account gRPC protobuf code"
Add-Commit -Path "account/repository.go" -Message "Implement account repository for PostgreSQL"
Add-Commit -Path "account/service.go" -Message "Implement account business logic"
Add-Commit -Path "account/server.go" -Message "Implement account gRPC server"
Add-Commit -Path "account/client.go" -Message "Implement account gRPC client"
Add-Commit -Path "account/up.sql" -Message "Add account database schema migration"
Add-Commit -Path "account/db.dockerfile" -Message "Add database dockerfile for account service"
Add-Commit -Path "account/app.dockerfile" -Message "Add app dockerfile for account service"
Add-Commit -Path "account/cmd" -Message "Add main entrypoint for account service"

Add-Commit -Path "catalog/catalog.proto" -Message "Define catalog gRPC service interface"
Add-Commit -Path "catalog/pb" -Message "Generate catalog gRPC protobuf code"
Add-Commit -Path "catalog/repository.go" -Message "Implement catalog repository for Elasticsearch"
Add-Commit -Path "catalog/service.go" -Message "Implement catalog business logic"
Add-Commit -Path "catalog/server.go" -Message "Implement catalog gRPC server"
Add-Commit -Path "catalog/client.go" -Message "Implement catalog gRPC client"
Add-Commit -Path "catalog/app.dockerfile" -Message "Add app dockerfile for catalog service"
Add-Commit -Path "catalog/cmd" -Message "Add main entrypoint for catalog service"

Add-Commit -Path "order/order.proto" -Message "Define order gRPC service interface"
Add-Commit -Path "order/pb" -Message "Generate order gRPC protobuf code"
Add-Commit -Path "order/repository.go" -Message "Implement order repository for PostgreSQL"
Add-Commit -Path "order/service.go" -Message "Implement order business logic"
Add-Commit -Path "order/server.go" -Message "Implement order gRPC server"
Add-Commit -Path "order/client.go" -Message "Implement order gRPC client"
Add-Commit -Path "order/up.sql" -Message "Add order database schema migration"
Add-Commit -Path "order/db.dockerfile" -Message "Add database dockerfile for order service"
Add-Commit -Path "order/app.dockerfile" -Message "Add app dockerfile for order service"
Add-Commit -Path "order/cmd" -Message "Add main entrypoint for order service"

Add-Commit -Path "graphql/schema.graphql" -Message "Define GraphQL schema for API gateway"
Add-Commit -Path "graphql/gqlgen.yml" -Message "Add gqlgen configuration"
Add-Commit -Path "graphql/models.go" -Message "Define base GraphQL models"
Add-Commit -Path "graphql/models_gen.go" -Message "Generate GraphQL models"
Add-Commit -Path "graphql/generated.go" -Message "Generate gqlgen execution code"
Add-Commit -Path "graphql/account_resolver.go" -Message "Implement account GraphQL resolvers"
Add-Commit -Path "graphql/query_resolver.go" -Message "Implement root query resolvers"
Add-Commit -Path "graphql/mutation_resolver.go" -Message "Implement root mutation resolvers"
Add-Commit -Path "graphql/graph.go" -Message "Implement GraphQL server graph and dependencies"
Add-Commit -Path "graphql/main.go" -Message "Add main entrypoint for GraphQL gateway"
Add-Commit -Path "graphql/app.dockerfile" -Message "Add app dockerfile for GraphQL gateway"

Add-Commit -Path "docker-compose.yaml" -Message "Add docker-compose for service orchestration"
git add .
git commit -m "Add remaining vendor files and configurations"

# Attempt to push to the repository
git push -u origin main -f
