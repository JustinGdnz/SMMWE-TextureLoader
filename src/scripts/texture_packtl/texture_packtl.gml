function texture_packtl() constructor {

	SCHESON_SCHEMA_VERSION = 1;
	SCHESON_SCHEMA
	{
		v1: {
	        type: "object",
	        properties: {
	            pack: {
	                type: "object",
	                properties: {
	                    Name: {
	                        type: "string",
	                        value: "<Name>"
	                    },
	                    Author: {
	                        type: "string",
	                        value: "<Author>"
	                    },
	                    Description: {
	                        type: "string",
	                        value: "<Description>"
	                    },
	                    Version: {
	                        type: "object",
	                        properties: {
	                            major: {
	                                type: "integer",
	                                value: 1
	                            },
	                            minor: {
	                                type: "integer",
	                                value: 0
	                            }
	                        }
	                    },
	                    TargetVersion: {
	                        type: "array",
	                        items: {
	                            type: "string"
	                        }
	                    },
	                    Credits: {
	                        type: "array",
	                        items: {
	                            type: "object",
	                            properties: {
	                                User: {
	                                    type: "string",
	                                    value: ""
	                                },
	                                SupportURL: {
	                                    type: "string",
	                                    value: ""
	                                }
	                            }
	                        }
	                    }
	                }
	            },
	            meta: {
	                type: "object",
	                properties: {
	                    format: {
	                        type: "integer",
	                        value: 1
	                    }
	                }
	            }
	        }
		}
	}
}