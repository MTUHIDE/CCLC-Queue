package queue3

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
        // 2018-07-20 ureel - Map common error pages
        "405"(view:'/notAllowed')    // Not Allowed
        "403"(view:'/forbidden')    // Forbidden
        "401"(view:'/unauthorized')    // Unauthorized
        "400"(view:'/badRequest')    // Bad Request
    }
}
