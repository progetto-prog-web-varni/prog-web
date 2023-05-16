<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>
<!-- HOME PAGE -->
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
        <title>Tum4World | HomePage</title>
    </head>

    <body>
        <%@ include file="Components/Navbar.jsp" %>
        <div id="body" class="container-body"
            style="background-color:lightgray; border:solid black; border-width: 2px 0px">
            <span>
                <div>
                    <figure>
                        <img style="margin:10px 10px; "
                            src="https://wips.plug.it/cips/tecnologia/cms/2017/11/sicurezza-informatica-2018.jpg"
                            width="320" height="240" />
                        <figcaption>
                            <p>Innovation to improve your life</p>
                        </figcaption>
                    </figure>
                </div>
            </span>
            <div style="padding-right:10px">
                <h2 style="text-align: center;">Descrizione dell'attività.</h2>
                <p style="text-align: center;">Lorem Ipsum is simply dummy text of the printing and typesetting
                    industry.
                    Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown
                    printer
                    took a galley of type and scrambled it to make a type specimen book. It has survived not only five
                    centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was
                    popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and
                    more
                    recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                </p>
                <button class="button">SCARICA VOLANTINO</button>
            </div>
        </div>

    </body>

    </html>
