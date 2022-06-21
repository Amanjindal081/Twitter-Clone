package tech.codingclub.helix.controller;

import org.jooq.Condition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tech.codingclub.helix.database.GenericDB;
import tech.codingclub.helix.entity.*;
import tech.codingclub.helix.global.SysProperties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;


@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
    @RequestMapping(method = RequestMethod.GET, value = "/welcome")
    public String userWelcome(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        Member x = ControllerUtils.getCurrentMember(request);


        return "welcome";


    }
    @RequestMapping(method = RequestMethod.POST, value = "/public-tweet/{id}")
    public
    @ResponseBody
    List<TweetUI> fetchTweet(@PathVariable("id") Long id, HttpServletRequest request, HttpServletResponse response) {
        Condition condition = tech.codingclub.helix.tables.Tweet.TWEET.ID.lessThan(id);
        List<Tweet> x =(List<Tweet>)GenericDB.getRows(tech.codingclub.helix.tables.Tweet.TWEET,Tweet.class,condition,3, tech.codingclub.helix.tables.Tweet.TWEET.ID.desc());
        Set<Long> memberIds = new HashSet<Long>();
        for(Tweet tweet: x){
            memberIds.add(tweet.author_id);
        }
        HashMap<Long,Member> memberHashMap=new HashMap<Long, Member>();
        Condition memberCondition= tech.codingclub.helix.tables.Member.MEMBER.ID.in(memberIds);
        List<Member> v= (List<Member>) GenericDB.getRows(tech.codingclub.helix.tables.Member.MEMBER,Member.class,memberCondition,null);
        for(Member member:v){
            memberHashMap.put(member.id,member);
        }
        ArrayList<TweetUI> list = new ArrayList<TweetUI>();
        for(Tweet tweet:x){
            Member member = memberHashMap.get(tweet.author_id);
            TweetUI tweetUI = new TweetUI(tweet,member);
            list.add(tweetUI);
        }
        return list;
    }


    @RequestMapping(method = RequestMethod.POST, value = "/create-post")
    public
    @ResponseBody
    String createTweet(@RequestBody String data, HttpServletRequest request, HttpServletResponse response) {
        Tweet tweet=new Tweet(data,null,new Date().getTime(),ControllerUtils.getUserId(request));
        new GenericDB<Tweet>().addRow(tech.codingclub.helix.tables.Tweet.TWEET,tweet);
        return "posted successfully";
    }
    @RequestMapping(method = RequestMethod.POST, value = "/follow-member/{member_id}")
    public
    @ResponseBody
    String followMember(@PathVariable("member_id") Long memberId, HttpServletRequest request, HttpServletResponse response) {
        Long currentuserid= ControllerUtils.getUserId(request);
        if(currentuserid!=null && memberId!=null && !currentuserid.equals(memberId)){
            Follow follow = new Follow(currentuserid,memberId);

            new GenericDB<Follow>().addRow(tech.codingclub.helix.tables.Follow.FOLLOW, follow);
            return "connected  successfully";
        }
        else{
            return "NOT PERMITED";
        }
    }
    @RequestMapping(method = RequestMethod.POST, value = "/un-follow-member/{member_id}")
    public
    @ResponseBody
    String unfollowMember(@PathVariable("member_id") Long memberId, HttpServletRequest request, HttpServletResponse response) {
        Long currentuserid= ControllerUtils.getUserId(request);
        if(currentuserid!=null && memberId!=null && !currentuserid.equals(memberId)){
            Condition condition= tech.codingclub.helix.tables.Follow.FOLLOW.USER_ID.eq(currentuserid).and(tech.codingclub.helix.tables.Follow.FOLLOW.FOLLOWING_ID.eq(memberId));
            boolean success = GenericDB.deleteRow(tech.codingclub.helix.tables.Follow.FOLLOW,condition);
            if(success) {


                return "un followed successfully";
            }
        }
        else{
            return "NOT PERMITED";
        }
        return "backend error";
    }
    @RequestMapping(method = RequestMethod.GET, value = "/recommendations")
    public String welcome(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        Member member = ControllerUtils.getCurrentMember(request);
         List<Member> x =(List<Member>)GenericDB.getRows(tech.codingclub.helix.tables.Member.MEMBER,Member.class,null,10,tech.codingclub.helix.tables.Member.MEMBER.ID.desc());
         ArrayList<Long> memberIds = new ArrayList<Long>();
         for(Member m: x){
             memberIds.add(m.id);
         }
        Condition condition= tech.codingclub.helix.tables.Follow.FOLLOW.USER_ID.eq(member.id).and(tech.codingclub.helix.tables.Follow.FOLLOW.FOLLOWING_ID.in(memberIds));
        List<Follow> y = (List<Follow>)GenericDB.getRows(tech.codingclub.helix.tables.Follow.FOLLOW,Follow.class,condition,null);
        Set<Long> followedMemberIds =new HashSet<Long>();
        for(Follow follow: y){
            followedMemberIds.add(follow.following_id);
        }
        for(Member memberTemp: x){
            if(followedMemberIds.contains(memberTemp.id)) {
                memberTemp.is_followed = true;
            }
        }
        modelMap.addAttribute("NAME",member.name);
        preloadVariables(modelMap,member.id);
        modelMap.addAttribute("RECOMMENDATIONS",x);

        return "recommendations";


    }
    private void preloadVariables(ModelMap modelMap,Long currentMemberId){
        modelMap.addAttribute("USER_IMAGE","/images/profile-image/"+currentMemberId+".jpeg");
    }
    @RequestMapping(method = RequestMethod.GET, value = "/followed")
    public String followed(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        Long currentMemberId = ControllerUtils.getUserId(request);
        Condition condition = tech.codingclub.helix.tables.Follow.FOLLOW.USER_ID.eq(currentMemberId);
        List<Long> followedIds = new GenericDB<Long>().getColumnRows(tech.codingclub.helix.tables.Follow.FOLLOW.FOLLOWING_ID,tech.codingclub.helix.tables.Follow.FOLLOW,Long.class,condition,100);
        List<Member> followedMembers =(List<Member>)GenericDB.getRows(tech.codingclub.helix.tables.Member.MEMBER,Member.class, tech.codingclub.helix.tables.Member.MEMBER.ID.in(followedIds),10,tech.codingclub.helix.tables.Member.MEMBER.ID.desc());
        modelMap.addAttribute("USER_IMAGE","/images/profile-image/"+currentMemberId+".jpeg");
        modelMap.addAttribute("FOLLOWED",followedMembers);

        return "followed";


    }
    @RequestMapping(method = RequestMethod.GET, value = "/update")
    public String updateUser(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {

        return "updateuser";
    }

    private static String saveUploadedFile( MultipartFile file, Long userId){
        try {
            String path = SysProperties.getBaseDir()+"/images/profile-image/"+userId+".jpeg";
            file.transferTo( new File(path));
            return "/images/profile-image/"+userId+".jpeg";
        } catch (IOException e) {
            e.printStackTrace();
        }
        return  null;
    }


    @RequestMapping(method = RequestMethod.POST, value = "/profile-image/upload")
    public ResponseEntity<?> uploadFile(
            @RequestParam("file") MultipartFile uploadfile, HttpServletRequest request) {
        if (uploadfile.isEmpty()) {
            return new ResponseEntity("please select a file!", HttpStatus.OK);
        }
        String path = "";
        try {
            Long currentMemberId = ControllerUtils.getUserId(request);
            path = saveUploadedFile(uploadfile,currentMemberId);
        } catch (Exception e) {
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity(path, new HttpHeaders(), HttpStatus.OK);
    }


}