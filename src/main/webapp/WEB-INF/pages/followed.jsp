    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <html lang="en" class=""><head>
          <meta charset="UTF-8">

          <meta name="robots" content="noindex">
          <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>


          <link rel="canonical" href="https://codepen.io/hussard/pen/RzdNgY">
          <link href="https://fonts.googleapis.com/css?family=DM+Sans&amp;display=swap" rel="stylesheet">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

          <link rel="stylesheet" href="/static/css/recommendations.css">

       </head>
       <body>
          <div id="root">
             <div>
                <div class="layout">
                   <div class="layout_wrapper">
                      <jsp:include page="template/navbar.jsp"/>
                      <div class="layout_content">
                         <div class="feed">
                            <div class="feed_header">
                               <h1 class="feed_title">Followed by my account</h1>
                            </div>
                            <div class="feed_item">

                           </div>
                           <c:forEach var="member" items="${FOLLOWED}" >
                               <div class="feed_item">
                                                         <div class="joke">
                                                            <div class="joke_wrapper">
                                                               <div class="joke_block joke_block--header">
                                                                  <span class="joke_element joke_element--author-name">${member.name}</span><span class="joke_element joke_element--author-username">${member.email}</span>
                                                                  <div class="joke_element joke_element--author-img"><img src="${USER_IMAGE}" ></div>
                                                               </div>
                                                               <div class="joke_block joke_block--text"><button class="follow-member followed-button" member-id="${member.id}" type="submit" tabindex="0">
                                                                    <span tabindex="-1">Follow</span>
                                                                </button></div>

                                                            </div>
                                                         </div>
                                                      </div>

                           </c:forEach>


















                            <div class="feed_footer">
                               <div class="pagination pagination--infinite-scroll"><button class="pagination_button_next">Load more...</button></div>
                            </div>
                         </div>
                      </div>
                      <jsp:include page="template/sidebar.jsp"/>
                   </div>
                </div>
             </div>
          </div>
          <script type="text/javascript" src ="/static/js/user.js">
          </script>





</body></html>