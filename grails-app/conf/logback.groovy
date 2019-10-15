import grails.util.BuildSettings
import grails.util.Environment
import org.springframework.boot.logging.logback.ColorConverter
import org.springframework.boot.logging.logback.WhitespaceThrowableProxyConverter

import java.nio.charset.Charset

conversionRule 'clr', ColorConverter
conversionRule 'wex', WhitespaceThrowableProxyConverter

// See http://logback.qos.ch/manual/groovy.html for details on configuration
appender('STDOUT', ConsoleAppender) {
    encoder(PatternLayoutEncoder) {
        charset = Charset.forName('UTF-8')

        pattern =
                '%clr(%d{yyyy-MM-dd HH:mm:ss.SSS}){faint} ' + // Date
                        '%clr(%5p) ' + // Log level
                        '%clr(---){faint} %clr([%15.15t]){faint} ' + // Thread
                        '%clr(%-40.40logger{39}){cyan} %clr(:){faint} ' + // Logger
                        '%m%n%wex' // Message
    }
}

// 2018-08-17 ureel - commented out default setup
//def targetDir = BuildSettings.TARGET_DIR
//if (Environment.isDevelopmentMode() && targetDir != null) {
//    appender("FULL_STACKTRACE", FileAppender) {
//        file = "${targetDir}/stacktrace.log"
//        append = true
//        encoder(PatternLayoutEncoder) {
//            pattern = "%level %logger - %msg%n"
//        }
//    }
//    logger("StackTrace", ERROR, ['FULL_STACKTRACE'], false)
//}
//root(ERROR, ['STDOUT'])

// 2018-08-17 ureel - specify app specific log file
def targetDir = BuildSettings.TARGET_DIR
def targetFile = System.getProperty("LOG_FILE")
if ((Environment.isDevelopmentMode()||Environment.current == Environment.DEVELOPMENT) && targetDir != null) {
    appender("FULL_STACKTRACE", FileAppender) {
        file = "${targetDir}/${targetFile}.log"
        append = true
        encoder(PatternLayoutEncoder) {
            pattern = "%clr(%d{yyyy-MM-dd HH:mm:ss.SSS}){faint} %level %logger - %msg%n"
        }
    }
    logger("StackTrace", INFO, ['FULL_STACKTRACE'], false)
    root(INFO, ['STDOUT', 'FULL_STACKTRACE'])
}
else if (Environment.current == Environment.TEST && targetDir != null) {
    appender("FULL_STACKTRACE", FileAppender) {
        file = "${targetDir}/${targetFile}.log"
        append = true
        encoder(PatternLayoutEncoder) {
            pattern = "%clr(%d{yyyy-MM-dd HH:mm:ss.SSS}){faint} %level %logger - %msg%n"
        }
    }
    logger("StackTrace", DEBUG, ['FULL_STACKTRACE'], false)
    root(DEBUG, ['STDOUT', 'FULL_STACKTRACE'])
}
else if (Environment.current == Environment.PRODUCTION && targetDir != null) {
    appender("FULL_STACKTRACE", FileAppender) {
        file = "${targetDir}/${targetFile}.log"
        append = true
        encoder(PatternLayoutEncoder) {
            pattern = '%clr(%d{yyyy-MM-dd HH:mm:ss.SSS}){faint} ' + // Date
                    '%clr(%5p) ' + // Log level
                    '%clr(---){faint} %clr([%15.15t]){faint} ' + // Thread
                    '%clr(%-40.40logger{39}){cyan} %clr(:){faint} ' + // Logger
                    '%m%n%wex'
        }
    }
    logger("StackTrace", ERROR, ['FULL_STACKTRACE'], false)
    root(ERROR, ['STDOUT', 'FULL_STACKTRACE'])
} else {
root(ERROR, ['STDOUT'])
}