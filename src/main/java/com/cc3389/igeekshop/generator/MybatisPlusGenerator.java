package com.cc3389.igeekshop.generator;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MybatisPlusGenerator {
        public static void main(String[] args) {
                List<String> tables = new ArrayList<>();
                tables.add("p_user");
                tables.add("p_question");
                tables.add("p_answer");
                tables.add("p_correct");
                FastAutoGenerator.create("jdbc:mysql://localhost:3306/igeekshop","root","123")
                        .globalConfig(builder -> {
                            builder.author("cc3389")               //作者
                                    //.outputDir(System.getProperty("user.dir")+"\\src\\main\\java")    //输出路径(写到java目录)
                                   .outputDir("D:/1")
                                    //.enableSwagger()           //开启swagger
                                    .commentDate("yyyy-MM-dd")
                                    .fileOverride();            //开启覆盖之前生成的文件

                        })
                        .packageConfig(builder -> {
                            builder.parent("com.cc3389.igeekshop")
                                    //.moduleName("practice")
                                    .entity("entity")
                                    .service("service")
                                    .serviceImpl("serviceImpl")
                                    .controller("controller")
                                    .mapper("mapper")
                                    .xml("mapper")
                                    .pathInfo(Collections.singletonMap(OutputFile.mapperXml,"D:/1"/*System.getProperty("user.dir")+"\\src\\main\\resources\\mapper"*/));
                        })
                        .strategyConfig(builder -> {
                            builder//.addInclude(tables)
                                    .addTablePrefix("p_")
                                    .serviceBuilder()
                                    .formatServiceFileName("%sService")
                                    .formatServiceImplFileName("%sServiceImpl")
                                    .entityBuilder()
                                    .enableLombok()
                                    .logicDeleteColumnName("deleted")
                                    .enableTableFieldAnnotation()
                                    .controllerBuilder()
                                    .formatFileName("%sController")
                                    .enableRestStyle()
                                    .mapperBuilder()
                                    .enableBaseResultMap()  //生成通用的resultMap
                                    .superClass(BaseMapper.class)
                                    .formatMapperFileName("%sMapper")
                                    .enableMapperAnnotation()
                                    .formatXmlFileName("%sMapper");
                        })
                       // .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                        .execute();
            }

}



