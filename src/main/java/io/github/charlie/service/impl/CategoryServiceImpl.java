package io.github.charlie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.charlie.model.entity.Category;
import io.github.charlie.service.CategoryService;
import io.github.charlie.mapper.CategoryMapper;
import org.springframework.stereotype.Service;

/**
* @author Charlie
* @description 针对表【sys_category(商品类别表)】的数据库操作Service实现
* @createDate 2025-02-05 16:51:33
*/
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category>
    implements CategoryService{

}




