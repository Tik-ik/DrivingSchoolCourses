package com.base.entity.common;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import java.util.ArrayList;
import java.util.List;

public class PictureItem {
    Picture picture;

    List<String> images;

    public Picture getPicture() {
        return picture;
    }

    public void setPicture(Picture picture) {
        this.picture = picture;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    public PictureItem()
    {

    }

    public PictureItem(Picture picture)
    {
        images = new ArrayList<String>();

        this.picture = picture;
        JSONArray jsonImg = JSON.parseArray(picture.getHeadPic());
        for(int i=0; i<jsonImg.size(); i++)
        {
            String img = "/photo/view?filename=" + jsonImg.getString(i);
            System.out.println(img);
            images.add(img);
        }
    }

    //转换
    public static List<PictureItem> getPictureItem(List<Picture> content)
    {
        List<PictureItem> pictureItems = new ArrayList<>();
        for(Picture item : content)
        {
            PictureItem pictureItem = new PictureItem(item);
            pictureItems.add(pictureItem);
        }

        return pictureItems;
    }
}
