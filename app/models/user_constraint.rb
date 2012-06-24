class UserConstraint
	def matches?(request)
		case request[:action]
		when "edit", "update", "destroy"
			# 自分のidの場合だけ編集できる
			request.session['user_id'] == request[:id].to_i
		else
			true
		end
	end
end