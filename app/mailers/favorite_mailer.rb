class FavoriteMailer < ApplicationMailer
	default from: "anthonyzardis@gmail.com"

	def new_comment(user, post, comment)
		headers["Message-ID"] = "<comments/#{comment.id}@bloccit.com>"
		headers["In-Reply_To"] = "<post/#{post.id}@bloccit.com>"
		headers["References"] = "<post/#{post.id}@bloccit.com"

		@user = user
		@post = post
		@comment = comment

		mail(to: user.email, subject: "New comment on #{post.title}")
	end

	def new_post(post)
		headers["Message-ID"] = "<posts/#{post.id}@bloccit.com>"
		headers["In-Reply_To"] = "<post/#{post.id}@bloccit.com>"
		headers["References"] = "<post/#{post.id}@bloccit.com"

		@post = post

		mail(to: post.user.email, subject: "New comment on #{post.title}")
	end
end
