package io.github.charlie.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.charlie.model.entity.Specification;
import io.github.charlie.service.SpecificationService;
import io.github.charlie.mapper.SpecificationMapper;
import org.springframework.stereotype.Service;

/**
* @author Charlie
* @description 针对表【sys_specification(规格表)】的数据库操作Service实现
* @createDate 2025-02-05 16:51:52
*/
@Service
public class SpecificationServiceImpl extends ServiceImpl<SpecificationMapper, Specification>
    implements SpecificationService{

}




