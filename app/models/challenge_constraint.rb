class ChallengeConstraint
  def matches?(request)

    case request[:action]
    when "show", "new", "index","destroy"
      true

    when "create"
      #from_user_idは自分のIDである必要がある
      request.session['user_id'] == request['challenge']['from_user_id'].to_i

    when "edit", "update"
      challenge = Challenge.find_by_id(request[:id])

      # challengeのステータスは'open'である必要がある
      return false unless challenge
      return false unless challenge.status == 'open'

      # 自分あてのchallengeしか編集できない
      request.session['user_id'] == challenge.to_user_id

    else
      false
    end
  end
end