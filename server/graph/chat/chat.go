package chat

// https://pkg.go.dev/github.com/ayush6624/go-chatgpt#ChatGPTModel

import (
	"context"
	"fmt"
	"log"
	"os"

	chatgpt "github.com/ayush6624/go-chatgpt"
	deepseek "github.com/cohesion-org/deepseek-go"
	"github.com/surrealdb/surrealdb.go"
)

type FoodSpec struct {
	Name        string
	ChineseName string
	UpperRange  float64
}
type SpecUnit string

// var gpt4o_mini chatgpt.ChatGPTModel = "gpt-4o-mini-2024-07-18"

var SpecLimits = []FoodSpec{
	{Name: "animal protein", ChineseName: "动物蛋白", UpperRange: 10.0},
	{Name: "plant protein", ChineseName: "植物蛋白", UpperRange: 12.3},
	{Name: "sodium", ChineseName: "纳", UpperRange: 10.0},
	{Name: "potassium", ChineseName: "钾", UpperRange: 12.3},
	{Name: "phosphorus", ChineseName: "磷", UpperRange: 12.3},
}

var conv_food_info = []chatgpt.ChatMessage{
	{
		Role: chatgpt.ChatGPTModelRoleUser,
		Content: "chat, what are the mg/100g content of animal protein, plant protein, sodium, potassium, and phosphorous in beef?\n" +
			"Please answer with only their content listed as below without any other greetings:\nanimal protein: [animal protein in mg/100g]\n" +
			"plant protein: [plant protein in mg/100g]\n...",
	},
	{
		Role: chatgpt.ChatGPTModelRoleAssistant,
		Content: `animal protein: 25000 mg/100g
		plant protein: 0 mg/100g
		sodium: 55 mg/100g
		potassium: 318 mg/100g
		phosphorus: 190 mg/100g`,
	},
	{
		Role:    chatgpt.ChatGPTModelRoleUser,
		Content: "very good answer, now for the rest of the conversation, if I only input a single food item name, please respond in this format",
	},
	{
		Role:    chatgpt.ChatGPTModelRoleAssistant,
		Content: "Understood! I'll follow that format for the rest of our conversation. Feel free to provide the food item when you're ready.",
	},
	{
		Role:    chatgpt.ChatGPTModelRoleUser,
		Content: "fish",
	},
	{
		Role: chatgpt.ChatGPTModelRoleAssistant,
		Content: `animal protein: 25000 mg/100g  
		plant protein: 0 mg/100g  
		sodium: 55 mg/100g  
		potassium: 318 mg/100g  
		phosphorus: 190 mg/100g`,
	},
	{
		Role:    chatgpt.ChatGPTModelRoleUser,
		Content: "鸡肉",
	},
	{
		Role: chatgpt.ChatGPTModelRoleAssistant,
		Content: `animal protein: 31000 mg/100g  
		plant protein: 0 mg/100g  
		sodium: 60 mg/100g  
		potassium: 256 mg/100g  
		phosphorus: 230 mg/100g`,
	},
	{
		Role:    chatgpt.ChatGPTModelRoleUser,
		Content: "空心菜",
	},
	{
		Role: chatgpt.ChatGPTModelRoleAssistant,
		Content: `animal protein: 0 mg/100g  
		plant protein: 2200 mg/100g  
		sodium: 70 mg/100g  
		potassium: 500 mg/100g  
		phosphorus: 40 mg/100g`,
	},
}

func GetClient() *chatgpt.Client {
	key := os.Getenv("OPENAI_KEY")

	client, err := chatgpt.NewClient(key)
	if err != nil {
		log.Fatal(err)
	}

	return client
}

func GetFoodSpec(food string, c *chatgpt.Client) (*string, error) {
	ctx := context.Background()

	messages := append(conv_food_info, chatgpt.ChatMessage{
		Role:    chatgpt.ChatGPTModelRoleUser,
		Content: food,
	})

	result, err := c.Send(ctx, &chatgpt.ChatCompletionRequest{
		Model:    chatgpt.GPT35Turbo,
		Messages: messages,
	})
	if err != nil {
		return nil, err
	}

	response, err := surrealdb.SmartUnmarshal[chatgpt.ChatResponse](result, nil)
	if err != nil {
		return nil, err
	}

	if len(response.Choices) == 0 {
		return nil, fmt.Errorf("no response was returned by gpt")
	}

	choice := response.Choices[0]
	return &choice.Message.Content, nil
}

func GetFoodRecommend(c *chatgpt.Client) (*string, error) {
	ctx := context.Background()

	result, err := c.SimpleSend(ctx, "chat,我是一名慢性肾病患者，你可以为我推荐一种适合食用的食物吗？请仅回答食物的名称，不要加任何的修饰词")

	if err != nil {
		return nil, err
	}

	response, err := surrealdb.SmartUnmarshal[chatgpt.ChatResponse](result, nil)
	if err != nil {
		return nil, err
	}

	if len(response.Choices) == 0 {
		return nil, fmt.Errorf("no response was returned by gpt")
	}

	choice := response.Choices[0]
	return &choice.Message.Content, nil
}

var conv_food_info_deepseek = []deepseek.ChatCompletionMessage{
	{
		Role: deepseek.ChatMessageRoleUser,
		Content: "deepseek, what are the mg/100g content of animal protein, plant protein, sodium, potassium, and phosphorous in beef?\n" +
			"Please answer with only their content listed as below without any other greetings:\nanimal protein: [animal protein in mg/100g]\n" +
			"plant protein: [plant protein in mg/100g]\n...",
	},
	{
		Role: deepseek.ChatMessageRoleAssistant,
		Content: `animal protein: 25000 mg/100g
		plant protein: 0 mg/100g
		sodium: 55 mg/100g
		potassium: 318 mg/100g
		phosphorus: 190 mg/100g`,
	},
	{
		Role:    deepseek.ChatMessageRoleUser,
		Content: "very good answer, now for the rest of the conversation, if I only input a single food item name, please respond in this format",
	},
	{
		Role:    deepseek.ChatMessageRoleAssistant,
		Content: "Understood! I'll follow that format for the rest of our conversation. Feel free to provide the food item when you're ready.",
	},
	{
		Role:    deepseek.ChatMessageRoleUser,
		Content: "fish",
	},
	{
		Role: deepseek.ChatMessageRoleAssistant,
		Content: `animal protein: 25000 mg/100g  
		plant protein: 0 mg/100g  
		sodium: 55 mg/100g  
		potassium: 318 mg/100g  
		phosphorus: 190 mg/100g`,
	},
	{
		Role:    deepseek.ChatMessageRoleUser,
		Content: "鸡肉",
	},
	{
		Role: deepseek.ChatMessageRoleAssistant,
		Content: `animal protein: 31000 mg/100g  
		plant protein: 0 mg/100g  
		sodium: 60 mg/100g  
		potassium: 256 mg/100g  
		phosphorus: 230 mg/100g`,
	},
	{
		Role:    deepseek.ChatMessageRoleUser,
		Content: "空心菜",
	},
	{
		Role: deepseek.ChatMessageRoleAssistant,
		Content: `animal protein: 0 mg/100g  
		plant protein: 2200 mg/100g  
		sodium: 70 mg/100g  
		potassium: 500 mg/100g  
		phosphorus: 40 mg/100g`,
	},
	{
		Role:    deepseek.ChatMessageRoleUser,
		Content: "海带炖带鱼",
	},
	{
		Role: deepseek.ChatMessageRoleAssistant,
		Content: `animal protein: 15000 mg/100g  
		plant protein: 500 mg/100g  
		sodium: 800 mg/100g  
		potassium: 700 mg/100g  
		phosphorous: 200 mg/100g`,
	},
}

func GetClientDeepSeek() *deepseek.Client {
	client := deepseek.NewClient(os.Getenv("DEEPSEEK_KEY"))
	return client
}

func GetFoodSpecDeepSeek(food string, c *deepseek.Client) (*string, error) {
	ctx := context.Background()

	messages := append(conv_food_info_deepseek, deepseek.ChatCompletionMessage{
		Role:    deepseek.ChatMessageRoleUser,
		Content: food,
	})

	response, err := c.CreateChatCompletion(ctx, &deepseek.ChatCompletionRequest{
		Model:    deepseek.DeepSeekChat,
		Messages: messages,
	})
	if err != nil {
		return nil, err
	}

	if len(response.Choices) == 0 {
		return nil, fmt.Errorf("no response was returned by deepseek")
	}

	return &response.Choices[0].Message.Content, nil
}

var conv_food_rec = []deepseek.ChatCompletionMessage{
	{
		Role:    deepseek.ChatMessageRoleUser,
		Content: "deepseek,我是一名慢性肾病患者，你可以为我推荐一种家常菜吗？推荐的家常菜应该符合低盐，低钾，低磷，且所用到的食材不含大蛋白分子的要求。请仅回答家常菜的名称，不要加任何的修饰词",
	},
	{
		Role:    deepseek.ChatMessageRoleAssistant,
		Content: "蒸南瓜",
	},
	{
		Role:    deepseek.ChatMessageRoleUser,
		Content: "deepseek,我是一名慢性肾病患者，你可以为我推荐一种家常菜吗？推荐的家常菜应该符合低盐，低钾，低磷，且所用到的食材不含大蛋白分子的要求。请仅回答家常菜的名称，不要加任何的修饰词",
	},
	{
		Role:    deepseek.ChatMessageRoleAssistant,
		Content: "烤红薯",
	},
	{
		Role:    deepseek.ChatMessageRoleUser,
		Content: "deepseek,我是一名慢性肾病患者，你可以为我推荐一种家常菜吗？推荐的家常菜应该符合低盐，低钾，低磷，且所用到的食材不含大蛋白分子的要求。请仅回答家常菜的名称，不要加任何的修饰词",
	},
	{
		Role:    deepseek.ChatMessageRoleAssistant,
		Content: "清炒西兰花",
	},
	{
		Role:    deepseek.ChatMessageRoleUser,
		Content: "deepseek,我是一名慢性肾病患者，你可以为我推荐一种家常菜吗？推荐的家常菜应该符合低盐，低钾，低磷，且所用到的食材不含大蛋白分子的要求。请仅回答家常菜的名称，不要加任何的修饰词",
	},
	{
		Role:    deepseek.ChatMessageRoleAssistant,
		Content: "大米粥",
	},
	{
		Role:    deepseek.ChatMessageRoleUser,
		Content: "deepseek,我是一名慢性肾病患者，你可以为我推荐一种家常菜吗？推荐的家常菜应该符合低盐，低钾，低磷，且所用到的食材不含大蛋白分子的要求。请仅回答家常菜的名称，不要加任何的修饰词",
	},
	{
		Role:    deepseek.ChatMessageRoleAssistant,
		Content: "西红柿炒鸡蛋",
	},
	{
		Role:    deepseek.ChatMessageRoleUser,
		Content: "deepseek,我是一名慢性肾病患者，你可以为我推荐一种家常菜吗？推荐的家常菜应该符合低盐，低钾，低磷，且所用到的食材不含大蛋白分子的要求。请仅回答家常菜的名称，不要加任何的修饰词",
	},
}

var idx = 1

func GetFoodRecommendDeepSeek(c *deepseek.Client) (*string, error) {
	ctx := context.Background()

	// request := &deepseek.ChatCompletionRequest{
	// 	Model: deepseek.DeepSeekChat,
	// 	Messages: []deepseek.ChatCompletionMessage{
	// 		{
	// 			Role:    deepseek.ChatMessageRoleUser,
	// 			Content: "deepseek,我是一名慢性肾病患者，你可以为我推荐一种吗？推荐的食物应该符合低盐，低钾，低磷，且不含大蛋白分子的要求。请仅回答食物的名称，不要加任何的修饰词",
	// 		},
	// 	},
	// 	Temperature: 2,
	// }

	// response, err := c.CreateChatCompletion(ctx, request)
	// if err != nil {
	// 	return nil, err
	// }

	request2 := &deepseek.ChatCompletionRequest{
		Model:       deepseek.DeepSeekChat,
		Messages:    conv_food_rec,
		Temperature: 2,
	}

	response, err := c.CreateChatCompletion(ctx, request2)
	if err != nil {
		return nil, err
	}

	if len(response.Choices) == 0 {
		return nil, fmt.Errorf("no response was returned by deepseek")
	}

	conv_food_rec[idx].Content = response.Choices[0].Message.Content
	idx = (idx + 2) % (len(conv_food_rec) - 1)

	return &response.Choices[0].Message.Content, nil
}
