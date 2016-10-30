package squarize.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class ArtistInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = -1275365006601555476L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> session = ctx.getSession();
		
		String isArtist = (String) session.get("isArtist");
		
		if(isArtist == null || isArtist.equals("N")){
			return "NO_ARTIST";
		}
		return invocation.invoke();
	}

}
