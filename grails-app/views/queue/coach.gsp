<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>CCLC Question Queuee</title>
</head>
<script>

    //Validate asking a question
    function validate() {
        if ($("#question").val() == '') {
            $("#questionError").html("Please type in a question!");
            $("#questionError").show(500);
            return false;
        }
        return true;
    }
</script>

<body>
<div id='pop' hidden=true></div>

<div class="container" style="padding: 0 !important;">
    <br>
    <ul class="nav nav-tabs nav-justified">
        <li class="active"><a data-toggle="tab" href="#OpenQuestions">Open Questions</a></li>
        <li><a data-toggle="tab" href="#AnsweredQuestions">Answered Questions</a></li>
    </ul>

    <div class="tab-content">
        <div id="OpenQuestions" class="tab-pane fade in active">
            <div class='panel panel-info'>
                <g:if test="${openQuestions == null || openQuestions.isEmpty()}">
                    <div class='container-fluid panel-heading' style="padding: 0 !important;">
                        No questions have been entered. Encourage students to use the Question Queue.
                    </div>
                </g:if>
                <g:else>
                    <div class='container-fluid panel-heading' style="padding: 0 !important;">
                        <div class="row" style="padding: 0 !important;">
                            <div class="col-xs-1" style="font-weight:900; color: black">Date</div>

                            <div class="col-xs-3" style="font-weight:900; color: black">Student</div>

                            <div class="col-xs-2" style="font-weight:900; color: black">Context</div>

                            <div class="col-xs-5" style="font-weight:900; color: black">Question</div>

                            <div class="col-xs-1"></div>
                        </div>
                    </div>

                    <div class="panel-body" style="padding: 0 !important;">
                        <g:each in="${openQuestions}" status="count" var="question">
                            <div class="container-fluid bg-info border ${count % 2 == 0 ? 'border-light' : 'border-dark'} border-3"
                                 style="background-color: ${count % 2 == 0 ? '#eee' : '#fff'};border: 3px solid ${count % 2 == 0 ? '#fff' : '#eee'} !important;border-radius: 5px;padding: 8px 3px 8px 3px !important;">
                                <div class="row" style="padding: 0 !important;">
                                    <div class="col-xs-1">${"#"+question.id+" " + question.dateCreated.format("MM/dd/yyyy HH:mm")}</div>

                                    <div class="col-xs-3">
                                        <div class="media" style="padding: 0 !important;">
                                            <div class="media-left">
                                                <img src="${question.person.imagePath}" class="media-object"
                                                     style="width:60px">
                                            </div>

                                            <div class="media-body">
                                                <h4 class="media-heading">${question.person.fullName}</h4>
                                                <g:link base="mailto:${question.person.eMail}?subject=[Queue:${question.id}">${question.person.eMail}</g:link>
                                                <g:if test="${question.isHandRaised}">
                                                    <br/><%= question.location() %><br/>
                                                    <asset:image
                                                            src="raising-hand-icon-5.svg" width="24px"/>
                                                </g:if>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-2">
                                        <div><b>Course:</b>${question.courseName}<br/></div>

                                        <div><b>Assignment:</b>${question.assignmentName}<br/></div>

                                        <div><b>Language:</b>${question.language}<br/></div>
                                    </div>

                                    <div class="col-xs-5">
                                        <B>Subject:</B> ${question.subject}<br/>
                                        <textarea class="col-xs-12" readonly
                                                  style="white-space: pre-wrap; overflow-wrap: break-word;">${question.message}</textarea>
                                    </div>

                                    <div class="col-xs-1">
                                        <!-- Trigger the modal with a button -->
                                        <div style="padding: 5px !important;">
                                            <button type="button" class="btn btn-info btn-lg" data-toggle="modal"
                                                    data-target="${'#openModal' + question.id}"
                                                    aria-label="Answer the Question"><div
                                                    data-toggle="tooltip" title="Answer the Question"><span
                                                        class="glyphicon glyphicon-comment" aria-hidden="true"></span>
                                            </div>
                                            </button>
                                        </div>
                                        <!-- Modal -->
                                        <div id="${'openModal' + question.id}" class="modal fade" role="dialog">
                                            <div class="modal-dialog modal-lg">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close"
                                                                data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Enter an Answer</h4>
                                                    </div>

                                                    <div class="modal-body">
                                                        <div>
                                                            <b>Subject:</b>${question.subject}<br/>
                                                        </div>
                                                        <div>
                                                            <label for="${'question' + question.id}">Question</label>
                                                            <textarea class="col-xs-12" readonly
                                                                      name="${'question' + question.id}"
                                                                      id="${'question' + question.id}"
                                                                      style="white-space: pre-wrap; overflow-wrap: break-word;"
                                                                      width="100%">
                                                                ${question.message}
                                                            </textarea>
                                                        </div>

                                                        <div><br/><hr/><br/></div>
                                                        <g:form name="ask" controller="queue" action="createAnswer"
                                                                onSubmit='return validate()'>
                                                            <input type='hidden' name="ticket"
                                                                   value="${ltiSession.id}"/>
                                                            <input type="hidden" name="question"
                                                                   value="${question.id}"/>

                                                            <div class='form-group'>
                                                                <label for='answer'>Answer</label>
                                                                <g:textArea class='form-control' name='answer'
                                                                            placeholder='Please write a detailed question.'
                                                                            width="100%"/>
                                                                <g:checkBox name="notify" value="${question.isHandRaised}"/> <label
                                                                    for='notify'>Email answer to ${question.person.fullName}.</label>
                                                            </div>


                                                            <button type="button" class="btn"
                                                                    data-dismiss="modal">Cancel</button>
                                                            <g:submitButton name="submit" value="Submit Answer!"
                                                                            class='btn btn-success'/>
                                                        </g:form>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <g:form action="deleteQuestion" style="padding: 5px !important;">
                                            <g:hiddenField name="ticket" value="${ltiSession.id}"/>
                                            <g:hiddenField name="question" value="${question.id}"/>
                                            <button type="submit" name="submit"
                                                    class="btn btn-info btn-lg"
                                                    aria-label="Delete the Question">
                                                <div data-toggle="tooltip" title="Delete the Question"><span
                                                        class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </div>
                                            </button>
                                        </g:form>
                                    </div>
                                </div>
                            </div>
                        </g:each>
                    </div>
                %{--</div>--}%
                </g:else>
            </div>
        </div>

        <div id="AnsweredQuestions" class="tab-pane fade">
            <div class='panel panel-info'>
                <g:if test="${answeredQuestions == null || answeredQuestions.isEmpty()}">
                    <div class='container-fluid panel-heading' style="padding: 0 !important;">
                        No questions have been answered. Try entering some answers.
                    </div>
                </g:if>
                <g:else>
                    <div class='container-fluid panel-heading' style="padding: 0 !important;">
                        <div class="row" style="padding: 0 !important;">
                            <div class="col-xs-1" style="font-weight:900; color: black">Date</div>

                            <div class="col-xs-3" style="font-weight:900; color: black">Student</div>

                            <div class="col-xs-2" style="font-weight:900; color: black">Assignment</div>

                            <div class="col-xs-5" style="font-weight:900; color: black">Question</div>

                            <div class="col-xs-1"></div>
                        </div>
                    </div>

                    <div class="panel-body" style="padding: 0 !important;">
                        <g:each in="${answeredQuestions}" status="count" var="question">
                            <div class="container-fluid bg-info border ${count % 2 == 0 ? 'border-light' : 'border-dark'} border-3"
                                 style="background-color: ${count % 2 == 0 ? '#eee' : '#fff'};border: 3px solid ${count % 2 == 0 ? '#fff' : '#eee'} !important;border-radius: 5px;padding: 8px 3px 8px 3px !important;">
                                <div class="row" style="padding: 0 !important;">
                                    <div class="col-xs-1">${"#"+question.id+" " + question.dateCreated.format("MM/dd/yyyy HH:mm")}</div>

                                    <div class="col-xs-3">
                                        <div class="media" style="padding: 0 !important;">
                                            <div class="media-left">
                                                <img src="${question.person.imagePath}" class="media-object"
                                                     style="width:60px">
                                            </div>

                                            <div class="media-body">
                                                <h4 class="media-heading">${question.person.fullName}</h4>
                                                <g:link base="mailto:${question.person.eMail}?subject=[Queue:${question.id}">${question.person.eMail}</g:link>
                                                <g:if test="${question.isHandRaised}">
                                                    <br/><%= question.location() %><br/>
                                                    <asset:image
                                                            src="raising-hand-icon-5.svg" width="24px"/>
                                                </g:if>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-2">
                                        <div><b>Course:</b>${question.courseName}<br/></div>

                                        <div><b>Assignment:</b>${question.assignmentName}<br/></div>

                                        <div><b>Language:</b>${question.language}<br/></div>
                                    </div>

                                    <div class="col-xs-5">
                                        <B>Subject:</B> ${question.subject}<br/>
                                        <textarea class="col-xs-12" readonly
                                                  style="white-space: pre-wrap; overflow-wrap: break-word;">${question.message}</textarea>
                                    </div>

                                    <div class="col-xs-1">
                                        <!-- Trigger the modal with a button -->
                                        <div style="padding: 5px !important;">
                                            <button type="button" class="btn btn-info btn-lg" data-toggle="modal"
                                                    data-target="${'#myModal' + question.id}"
                                                    aria-label="Answer the Question"><div
                                                    data-toggle="tooltip" title="Answer the Question"><span
                                                        class="glyphicon glyphicon-comment" aria-hidden="true"></span>
                                            </div>
                                            </button>
                                        </div>

                                        <!-- Modal -->
                                        <div id="${'myModal' + question.id}" class="modal fade" role="dialog">
                                            <div class="modal-dialog modal-lg">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close"
                                                                data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Enter an Answer</h4>
                                                    </div>

                                                    <div class="modal-body">
                                                        <div>
                                                            <b>Subject:</b>${question.subject}<br/>
                                                        </div>
                                                        <div>
                                                            <label for="${'question2' + question.id}">Question</label>
                                                            <textarea class="col-xs-12" readonly
                                                                      name="${'question2' + question.id}"
                                                                      id="${'question2' + question.id}"
                                                                      style="white-space: pre-wrap; overflow-wrap: break-word;"
                                                                      width="100%">
                                                                ${question.message}
                                                            </textarea>
                                                        </div>

                                                        <div><br/><hr/><br/></div>
                                                        <g:form name="ask" controller="queue" action="createAnswer"
                                                                onSubmit='return validate()'>
                                                            <input type='hidden' name="ticket"
                                                                   value="${ltiSession.id}"/>
                                                            <input type="hidden" name="question"
                                                                   value="${question.id}"/>

                                                            <div class='form-group'>
                                                                <label for='answer'>Answer</label>
                                                                <g:textArea class='form-control' name='answer'
                                                                            placeholder='Please write a detailed question.'
                                                                            width="100%"/>
                                                                <g:checkBox name="notify" value="${question.isHandRaised}"/> <label
                                                                    for='notify'>Email answer to ${question.person.fullName}.</label>
                                                            </div>


                                                            <button type="button" class="btn"
                                                                    data-dismiss="modal">Cancel</button>
                                                            <g:submitButton name="submit" value="Submit Answer!"
                                                                            class='btn btn-success'/>
                                                        </g:form>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <g:form action="deleteQuestion" style="padding: 5px !important;">
                                            <g:hiddenField name="ticket" value="${ltiSession.id}"/>
                                            <g:hiddenField name="question" value="${question.id}"/>
                                            <button type="submit" name="submit"
                                                    class="btn btn-info btn-lg"
                                                    aria-label="Delete the Question">
                                                <div data-toggle="tooltip" title="Delete the Question"><span
                                                        class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                </div>
                                            </button>
                                        </g:form>
                                    </div>
                                </div>
                                <g:each in="${myQuestionsAndAnswers.get(question)}" var="answer">
                                    <div class="row"
                                         style="padding: 5px 20px 5px 20px !important;">
                                        <div class="container-fluid span12 border border-danger rounded-left border-3"
                                             style="padding: 3px !important;border: 3px solid red !important;">
                                            <div class="col-xs-1">${answer.dateCreated.format("MM/dd/yyyy HH:mm")}</div>

                                            <div class="col-xs-3">
                                                <div class="media" style="padding: 0 !important;">
                                                    <div class="media-left">
                                                        <img src="${answer.person.imagePath}" class="media-object"
                                                             style="width:60px">
                                                    </div>

                                                    <div class="media-body">
                                                        <h4 class="media-heading">${answer.person.fullName}</h4>
                                                        <g:link base="mailto:${answer.person.eMail}?subject=[Question Queue:${question.id}]">${answer.person.eMail}</g:link>
                                                    </div>
                                                </div>
                                            </div>

                                            <textarea class="col-xs-7" readonly
                                                      style="white-space: pre-wrap; overflow-wrap: break-word;">${answer.answerText}</textarea>

                                            <div class="col-xs-1">
                                                <g:form action="deleteAnswer">
                                                    <g:hiddenField name="ticket" value="${ltiSession.id}"/>
                                                    <g:hiddenField name="answer" value="${answer.id}"/>
                                                    <button type="submit" name="submit"
                                                            class="btn btn-info btn-lg"
                                                            aria-label="Delete this Answer">
                                                        <div data-toggle="tooltip" title="Delete this Answer"><span
                                                                class="glyphicon glyphicon-trash"
                                                                aria-hidden="true"></span>
                                                        </div>
                                                    </button>
                                                </g:form>
                                            </div>
                                        </div>
                                    </div>
                                </g:each>
                            </div>
                        </g:each>
                    </div>
                %{--</div>--}%
                </g:else>
            </div>
        </div>
    </div>
</div>
</body>
</html>