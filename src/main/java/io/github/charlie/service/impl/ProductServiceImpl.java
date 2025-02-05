package io.github.charlie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.charlie.model.entity.Product;
import io.github.charlie.service.ProductService;
import io.github.charlie.mapper.ProductMapper;
import org.springframework.stereotype.Service;

/**
* @author Charlie
* @description 针对表【sys_product(商品表)】的数据库操作Service实现
* @createDate 2025-02-05 15:48:00
*/
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product>
    implements ProductService{

}




