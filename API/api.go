package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

type note struct {
	ID    int    `json:"id"`
	Title string `json:"title"`
	Note  string `json:"note"`
}

var notes = []note{
	{ID: 1, Title: "Catatan 1", Note: "Cras quis quam eu dui elementum vulputate. Nulla id vulputate dui. Morbi sit amet elementum tellus. Fusce tempor posuere quam ut suscipit. Fusce in porta ante, eu varius urna. Integer arcu nisl, imperdiet eu lorem vitae, elementum pretium nunc. Curabitur a nulla ac nunc aliquet auctor. "},
	{ID: 2, Title: "Catatan 2", Note: "Integer placerat efficitur vestibulum. Proin vitae metus ut urna mollis molestie. Cras ultrices congue commodo. Integer molestie vitae libero vitae volutpat. Duis a porttitor nisi, sed aliquet urna. Morbi laoreet lectus leo, eu ornare leo laoreet id. Proin porttitor non sem at mattis. Suspendisse pharetra condimentum elit et imperdiet. Praesent vel quam lacinia, suscipit sem eu, dapibus mi. Suspendisse fermentum tellus nec ipsum ullamcorper, eget viverra velit posuere. "},
	{ID: 3, Title: "Catatan 3", Note: "Phasellus dignissim, felis a malesuada tempus, ipsum magna porttitor dolor, ac pellentesque justo turpis quis erat. Morbi vitae interdum felis. Nullam euismod suscipit nibh eu ullamcorper. Proin quis sapien nec libero porta luctus ut ac mauris. Sed tempus lectus in rutrum fermentum. Suspendisse at mollis erat. Vestibulum porttitor quam mauris, ac tristique odio tincidunt et. Sed dapibus justo urna, faucibus scelerisque felis lobortis sit amet. Quisque sit amet pellentesque justo, quis tempor urna. Vestibulum eget neque convallis, iaculis est quis, ornare turpis. "},
	{ID: 4, Title: "Catatan 4", Note: "Nullam sed purus ut lorem tincidunt posuere id in orci. Donec iaculis libero arcu, quis varius purus blandit ac. Pellentesque augue neque, sodales placerat eros eu, vestibulum efficitur sem. Quisque consectetur justo magna, at luctus metus mattis vitae. Proin posuere commodo posuere. Maecenas eget ante commodo augue cursus elementum nec sodales est. Sed at tempor nulla, id convallis risus. Nunc sed justo ut mi mattis cursus a quis urna. Sed placerat, ligula non accumsan interdum, metus felis cursus felis, vel viverra nulla est et erat. Phasellus eu turpis eget nulla finibus convallis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam id tellus id libero condimentum eleifend nec nec ipsum. Proin rutrum, tortor sit amet lobortis bibendum, elit eros sodales leo, sed convallis massa arcu id magna. Maecenas facilisis varius semper. Vestibulum sed leo nec erat vulputate eleifend ullamcorper vel leo. Nulla vitae ligula turpis. "},
}

func getNotes(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, notes)
}

func main() {
	router := gin.Default()
	router.GET("/notes", getNotes)
	router.Run()
}
