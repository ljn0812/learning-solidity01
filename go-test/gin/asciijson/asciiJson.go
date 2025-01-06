package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	r.GET("/", func(ctx *gin.Context) {
		data := map[string]interface{}{
			"lang": "go語言",
			"tag":  "<br>",
		}
		ctx.AsciiJSON(http.StatusOK, data)
	})

	r.Run(":8080")
}
