class DocumentNotifier < ActionMailer::Base
  def writing_started_on(document)
    @document = document
    logger.warn("Sending a notification to #{document.requester}")
    mail(to: document.requester,
         from: "no-reply@livewritingseries.com",
         subject: "[LiveWritingSeries] Work on the document you requested has started")
  end
end
