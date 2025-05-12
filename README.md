# Inicialização do Projeto

Siga os passos abaixo para configurar o ambiente e inicializar o projeto localmente:

## Pré-requisitos

Certifique-se de ter os seguintes itens instalados no seu sistema:
- **Ruby**: Verifique a versão necessária no arquivo `.ruby-version`.
- **Bundler**: Instale com `gem install bundler` se ainda não estiver instalado.

## Passos para Configuração

1. **Clone o Repositório**
    ```bash
    git clone https://github.com/FelipePaivaVale/CCUERNWEB
    cd CCUERNWEB
    ```

2. **Instale as Dependências**  
    Execute o comando abaixo para instalar as dependências do projeto:
    ```bash
    bundle install
    ```

3. **Configuração do Banco de Dados**  
    Crie e inicialize o banco de dados:
    ```bash
    rails db:create db:migrate
    ```

4. **Inicialize o Servidor**  
    Inicie o servidor Rails:
    ```bash
    rails server
    ```

5. **Acesse a Aplicação**  
    Abra o navegador e acesse [http://localhost:3000](http://localhost:3000).

## Exemplos de Desenvolvimento

### Criando um Model
Para criar um novo modelo (ex: `Product`):

```bash
rails generate model Product name:string description:text price:decimal
```

Isso criará:
- Um arquivo de migração em `db/migrate/`
- Um modelo em `app/models/product.rb`

Após criar o model, execute:
```bash
rails db:migrate
```

### Criando um Controller API
Para criar um controller para a API (ex: `ProductsController`):

```bash
rails generate controller api/v1/products
```

Exemplo de controller básico (`app/controllers/api/v1/products_controller.rb`):

```ruby
module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :update, :destroy]

      # GET /api/v1/products
      def index
        @products = Product.all
        render json: @products
      end

      # GET /api/v1/products/1
      def show
        render json: @product
      end

      # POST /api/v1/products
      def create
        @product = Product.new(product_params)

        if @product.save
          render json: @product, status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      private

      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:name, :description, :price)
      end
    end
  end
end
```

### Configurando Rotas
Adicione no `config/routes.rb`:

```ruby
namespace :api do
  namespace :v1 do
    resources :products
  end
end
```

### Comandos Úteis

- **Console Rails**: Acesse o console interativo para testar modelos:
    ```bash
    rails console
    ```

- **Visualizar Rotas**: Veja todas as rotas disponíveis:
    ```bash
    rails routes
    ```

- **Testes**: Execute os testes do projeto:
    ```bash
    rails test
    ```

- **Seeds**: Popule o banco com dados iniciais:
    ```bash
    rails db:seed
    ```