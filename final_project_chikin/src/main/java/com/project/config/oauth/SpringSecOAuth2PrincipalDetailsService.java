package com.project.config.oauth;

import com.project.config.auth.SpringSecPrincipalDetails;
import com.project.config.oauth.provider.GoogleUserInfo;
import com.project.config.oauth.provider.KakaoUserInfo;
import com.project.config.oauth.provider.NaverUserInfo;
import com.project.config.oauth.provider.OAuth2Userlnfo;
import com.project.domain.MemberVO;
import com.project.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class SpringSecOAuth2PrincipalDetailsService extends DefaultOAuth2UserService {

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

        OAuth2User oAuth2User = super.loadUser(userRequest);

        OAuth2Userlnfo oAuth2Userlnfo = null;
        if (userRequest.getClientRegistration().getRegistrationId().equals("google")) {
            oAuth2Userlnfo = new GoogleUserInfo(oAuth2User.getAttributes());
        } else if (userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
            oAuth2Userlnfo = new NaverUserInfo((Map)oAuth2User.getAttributes().get("response"));
        } else if (userRequest.getClientRegistration().getRegistrationId().equals("kakao")) {
            oAuth2Userlnfo = new KakaoUserInfo(oAuth2User.getAttributes());
        } else {
            return null;
        }

        String provider = oAuth2Userlnfo.getProvider();
        String providerId = oAuth2Userlnfo.getProviderId();
        String username = provider + "_" + providerId;
        String password = "-";
        String email = oAuth2Userlnfo.getEmail();
        String phone = "-";

        String role = "ROLE_USER";

        MemberVO memberVO = memberMapper.selectByUserName(username);

        if (memberVO == null) {
            memberVO = MemberVO.builder()
                    .korName("-")
                    .provider(provider)
                    .providerId(providerId)
                    .username(username)
                    .password(password)
                    .email(email)
                    .phone(phone)
                    .role(role)
                    .build();
            memberMapper.insertMember(memberVO);
        } else {

        }
        return new SpringSecPrincipalDetails(memberVO, oAuth2User.getAttributes());
    }
}
