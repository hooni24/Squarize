package squarize.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor{
	private static final long serialVersionUID = 3530175190252496916L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> session = ctx.getSession();
		
		String loginId = (String) session.get("loginId");
		
		if(loginId == null){
			return Action.LOGIN;
		}
		return invocation.invoke();
	}

}
