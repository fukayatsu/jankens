
class UserConstraint
	def matches?(request)
		if ["edit", "update", "destroy"].include?(request[:action])
			# 自分のidだけ編集できる
			# TODO ここでやるべきなのか不明
			return request.session['user_id'] == request[:id].to_i
			false
		else
			true
		end
	end
end