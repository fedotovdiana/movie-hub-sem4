<#include 'header.ftlh'>
<#include 'libraries.ftlh'>
<#import "spring.ftl" as spring />

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css" type="text/css">

    <title><@spring.message 'header.films'/></title>
</head>
<body class="photo">
<@header/>
<section class="jumbotron text-center">
    <div class="container">
        <h2 class="jumbotron-heading"><@spring.message 'header.films'/></h2>
    </div>
</section>
<div class="container">
    <div class="row">
        <form>
            <div>
                <div class="col-auto my-1">
                    <div class="form-group help">
                        <input type="text" class="form-control" id="query" oninput="f()"
                               placeholder="<@spring.message 'films.page.find'/>">
                    </div>
                </div>
                <script type="application/javascript">
                    function f(page) {
                        if ($("#query").val().length >= 1) {
                            $.ajax({
                                url: "/films/search",
                                data: {
                                    "query": $("#query").val(),
                                    "page": 0,
                                    "size": 0
                                },
                                success: function (msg) {
                                    if (msg.length > 0) {
                                        $("#res").html("");
                                        for (var i = 0; i < msg.length; i++) {
                                            $("#res").append("<div class=\"col-md-3\">\n" +
                                                "                <div class=\"card mb-4\">\n" +
                                                "                    <a href=\"/films/" + msg[i].id + "\"><img src=\"/img/" + msg[i].photo + "\"\n" +
                                                "                                                                        class=\"img-thumbnail\" alt=\"...\"></a>\n" +
                                                "                    <div class=\"card-body\">\n" +
                                                "                        <ul class=\"list-unstyled text-center mb-2\">\n" +
                                                "                            <li>\n" +
                                                "                            </li>\n" +
                                                "                            <li><a href=\"/films/" + msg[i].id + "\" class=\"reg\">" + msg[i].name + "<br>" + msg[i].country + "</a>\n" +
                                                "                            </li>\n" +
                                                "                        </ul>\n" +
                                                "                    </div>\n" +
                                                "                </div>\n" +
                                                "            </div>");
                                        }
                                        for (var i = 1; i <= msg.count; i++) {
                                            $("#pages-button-spawn").append("<button class='like-disable' onclick=\"f(" + i + ")\"> " + i + "</button>");
                                        }
                                    } else {
                                        $("#res").html("<h2><a href='#'><@spring.message 'films.page.result'/></a></h2>");
                                    }
                                }
                            })
                        } else {
                            $("#res").html("<#list films as f><div class=\"col-md-3\">\n" +
                                "                <div class=\"card mb-4\">\n" +
                                "                    <a href=\"/films/${f.id}\"><img src=\"/img/${f.photo}\"\n" +
                                "                                      class=\"img-thumbnail\" alt=\"...\"></a>\n" +
                                "                    <div class=\"card-body\">\n" +
                                "                        <ul class=\"list-unstyled text-center mb-2\">\n" +
                                "                            <li>\n" +
                                "                            </li>\n" +
                                "                            <li><a href=\"/films/${f.id}\" \n" +
                                "                                       class=\"reg\">${f.name}<br>${f.country}</a>\n" +
                                "                            </li>\n" +
                                "                        </ul>\n" +
                                "                    </div>\n" +
                                "                </div>\n" +
                                "            </div></#list>");
                        }
                    }
                </script>
            </div>
        </form>
    </div>
    <div class="row" id="res">
        <#list films as f>
            <div class="col-md-3">
                <div class="card mb-4">
                    <a href="/films/${f.id}"><img src="/img/${f.photo}" class="img-thumbnail" alt="..."></a>
                    <div class="card-body">
                        <ul class="list-unstyled text-center mb-2">
                            <li>
                                <#--                                <h8 class="display-4 like">318 |</h8>-->
                                <#--                                <h8 class="display-4 dislike">5</h8>-->
                            </li>
                            <li><a href="/films/${f.id}" class="reg">${f.name}<br>${f.country}</a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </#list>
    </div>
    <nav aria-label="...">
        <ul class="pagination pagination-sm">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1">1</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
        </ul>
    </nav>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>
