class Api::V1::UsersbestsController < Api::V1::GraphitiController
  def index
    usersbests = UsersbestResource.all(params)
    respond_with(usersbests)
  end

  def show
    usersbest = UsersbestResource.find(params)
    respond_with(usersbest)
  end

  def create
    usersbest = UsersbestResource.build(params)

    if usersbest.save
      render jsonapi: usersbest, status: :created
    else
      render jsonapi_errors: usersbest
    end
  end

  def update
    usersbest = UsersbestResource.find(params)

    if usersbest.update_attributes
      render jsonapi: usersbest
    else
      render jsonapi_errors: usersbest
    end
  end

  def destroy
    usersbest = UsersbestResource.find(params)

    if usersbest.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: usersbest
    end
  end
end
