package com.me7eorite.config;

import com.me7eorite.entity.User;
import com.me7eorite.mapper.UserMapper;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Author Me7eorite
 * @Date 2021/12/24 16:07
 * @Description realm实现用户认证
 */

public class ShiroRealm extends AuthorizingRealm {
    @Autowired
    private UserMapper userMapper;
    /**
     * @Author me7eorite
     * @Desc  获取用户角色和权限
     * @Param [org.apache.shiro.subject.PrincipalCollection]
     * @return org.apache.shiro.authz.AuthorizationInfo
     * @Date 2021/12/24 16:16
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
        return null;
    }
    /**
     * @Author me7eorite
     * @Desc  登录验证
     * @Param [org.apache.shiro.authc.AuthenticationToken]
     * @return org.apache.shiro.authc.AuthenticationInfo
     * @Date 2021/12/24 16:16
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        String password = new String((char[]) token.getCredentials());
        User user = userMapper.queryUserByName(username);
        if(user == null){
            throw new UnknownAccountException("账号或密码错误");
        }
        if(!password.equals(user.getPwd())){
            throw new IncorrectCredentialsException("用户名或密码错误");
        }
        if(user.getStatus()== 0){
            throw new LockedAccountException("账号已经被锁定，请联系管理员!");
        }
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user,password,getName());
        return info;
    }
}
