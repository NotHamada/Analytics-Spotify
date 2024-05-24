include("Login.jl")
using JSON
using HTTP

function Authenticate()
    request_body = Login()

    body = JSON.parse(request_body)

    return body
end