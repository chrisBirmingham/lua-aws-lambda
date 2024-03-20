local app = {}

function app.handler(event, context)
    local name = event['name'] or 'unknown'
    return "Hello " .. name
end

return app
